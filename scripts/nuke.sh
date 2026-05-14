#!/bin/sh
# nuke.sh — Aggressive project artifact cleanup
# Run without arguments to preview all sections and confirm each separately
# Run with --confirm to enter deletion mode
# Run with --confirm node_modules dist to target specific dirs only

# ─────────────────────────────────────────────
# Config
# ─────────────────────────────────────────────

SEARCH_DIR="${NUKE_DIR:-$HOME/Projects}"
CONFIRM=false
ALL_TARGET_DIRS="node_modules .next .nuxt dist vendor target .build bin out"

if [ "$1" = "--confirm" ]; then
  CONFIRM=true
  shift
fi

# If args remain after --confirm, use them as target dirs; otherwise use all
if [ "$#" -gt 0 ]; then
  TARGET_DIRS="$*"
else
  TARGET_DIRS="$ALL_TARGET_DIRS"
fi

# ─────────────────────────────────────────────
# Helpers
# ─────────────────────────────────────────────

free_space_human() {
  diskutil info / | awk '/Free Space/ {print $4, $5}'
}

free_space_bytes() {
  df / | awk 'NR==2 {print $4}'
}

dir_size_kb() {
  du -sk "$1" 2>/dev/null | awk '{print $1}'
}

kb_to_human() {
  echo "$1" | awk '{
    if ($1 >= 1048576) printf "%.1f GB", $1/1048576
    else if ($1 >= 1024) printf "%.1f MB", $1/1024
    else printf "%d KB", $1
  }'
}

# ─────────────────────────────────────────────
# Scan & act
# ─────────────────────────────────────────────

echo "💣 Nuke — Project Artifact Scanner"
echo "===================================="
echo "Scanning: $SEARCH_DIR"
if [ "$CONFIRM" = true ]; then
  echo "Mode:     confirm (will prompt per section)"
else
  echo "Mode:     dry run"
fi
echo ""

GRAND_TOTAL_KB=0
GRAND_TOTAL_COUNT=0
GRAND_TOTAL_DELETED_KB=0
GRAND_TOTAL_DELETED_COUNT=0
BEFORE=$(free_space_bytes)

for dir_name in $TARGET_DIRS; do
  SECTION_FILE=$(mktemp)
  section_kb=0
  section_count=0
  first=1

  while IFS= read -r dir; do
    [ -z "$dir" ] && continue
    if [ "$first" -eq 1 ]; then
      echo "── $dir_name ────────────────────────────────────────"
      first=0
    fi
    kb=$(dir_size_kb "$dir")
    size=$(kb_to_human "$kb")
    printf "  %-12s %s\n" "$size" "$dir"
    echo "$dir" >> "$SECTION_FILE"
    section_count=$((section_count + 1))
    section_kb=$((section_kb + kb))
  done << FINDEOF
$(find "$SEARCH_DIR" -type d -name "$dir_name" -prune 2>/dev/null)
FINDEOF

  if [ "$first" -eq 1 ]; then
    rm -f "$SECTION_FILE"
    continue
  fi

  section_human=$(kb_to_human "$section_kb")
  echo "  ────────────────────────────────────────────────"
  printf "  %d directories, %s\n" "$section_count" "$section_human"
  echo ""

  GRAND_TOTAL_KB=$((GRAND_TOTAL_KB + section_kb))
  GRAND_TOTAL_COUNT=$((GRAND_TOTAL_COUNT + section_count))

  if [ "$CONFIRM" = true ]; then
    printf "🗑️  Delete all %s directories (%s)? [y/N] " "$dir_name" "$section_human"
    read -r response
    echo ""
    case "$response" in
      [Yy])
        while IFS= read -r dir; do
          [ -z "$dir" ] && continue
          echo "  Removing $dir..."
          rm -rf "$dir"
          GRAND_TOTAL_DELETED_COUNT=$((GRAND_TOTAL_DELETED_COUNT + 1))
        done < "$SECTION_FILE"
        GRAND_TOTAL_DELETED_KB=$((GRAND_TOTAL_DELETED_KB + section_kb))
        echo "  ✓ Done"
        echo ""
        ;;
      *)
        echo "  Skipped."
        echo ""
        ;;
    esac
  fi

  rm -f "$SECTION_FILE"
done

# ─────────────────────────────────────────────
# Summary
# ─────────────────────────────────────────────

GRAND_TOTAL_HUMAN=$(kb_to_human "$GRAND_TOTAL_KB")

echo "══════════════════════════════════════════════════════"
echo "Summary"
echo "──────────────────────────────────────────────────────"
printf "  Found:   %d directories, %s\n" "$GRAND_TOTAL_COUNT" "$GRAND_TOTAL_HUMAN"

if [ "$CONFIRM" = true ]; then
  AFTER=$(free_space_bytes)
  FREED=$(( (AFTER - BEFORE) * 512 ))
  FREED_HUMAN=$(echo "$FREED" | awk '{
    if ($1 >= 1073741824) printf "%.1f GB", $1/1073741824
    else if ($1 >= 1048576) printf "%.1f MB", $1/1048576
    else if ($1 >= 1024) printf "%.1f KB", $1/1024
    else printf "%d B", $1
  }')
  printf "  Deleted: %d directories\n" "$GRAND_TOTAL_DELETED_COUNT"
  printf "  Freed:   %s\n" "$FREED_HUMAN"
  printf "  Space:   %s\n" "$(free_space_human)"
else
  echo ""
  echo "ℹ️  This is a dry run. To delete interactively, run:"
  echo ""
  echo "    ./nuke.sh --confirm"
  echo ""
  echo "  Or target specific dirs:"
  echo ""
  echo "    ./nuke.sh --confirm node_modules dist"
fi

echo "══════════════════════════════════════════════════════"
echo ""
echo "✅ Nuke complete"
