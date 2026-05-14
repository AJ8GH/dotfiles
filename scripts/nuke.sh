#!/bin/bash
# nuke.sh — Aggressive project artifact cleanup
# Removes node_modules, build artifacts, and vendor dirs across ~/Projects

# ─────────────────────────────────────────────
# Helpers
# ─────────────────────────────────────────────

free_space_human() {
  diskutil info / | awk '/Free Space/ {print $4, $5}'
}

free_space_bytes() {
  df / | awk 'NR==2 {print $4}'
}

nuke_dirs() {
  local label=$1
  local dir_name=$2
  local found=0
  local count=0

  while IFS= read -r -d '' dir; do
    if [ "$found" -eq 0 ]; then
      echo "Removing $label directories..."
      found=1
    fi
    echo "  $dir"
    rm -rf "$dir"
    count=$((count + 1))
  done < <(find ~/Projects -type d -name "$dir_name" -prune -print0 2>/dev/null)

  if [ "$found" -eq 0 ]; then
    echo "No $label directories found"
  else
    echo "✓ Removed $count $label directories"
  fi
  echo ""
}

# ─────────────────────────────────────────────
# Start
# ─────────────────────────────────────────────

echo "💣 Starting nuke..."
echo ""
echo "Free space before: $(free_space_human)"
echo ""
BEFORE=$(free_space_bytes)

# ─────────────────────────────────────────────
# Node
# ─────────────────────────────────────────────

nuke_dirs "node_modules" "node_modules"
nuke_dirs ".next" ".next"
nuke_dirs ".nuxt" ".nuxt"
nuke_dirs "dist" "dist"

# ─────────────────────────────────────────────
# Go
# ─────────────────────────────────────────────

nuke_dirs "Go vendor" "vendor"

# ─────────────────────────────────────────────
# Build artifacts
# ─────────────────────────────────────────────

nuke_dirs "target (Rust/Java)" "target"
nuke_dirs ".build (Swift)" ".build"
nuke_dirs "bin" "bin"
nuke_dirs "out" "out"

# ─────────────────────────────────────────────
# Summary
# ─────────────────────────────────────────────

AFTER=$(free_space_bytes)
TOTAL=$(( (AFTER - BEFORE) * 512 ))
TOTAL_HUMAN=$(echo "$TOTAL" | awk '{
  if ($1 >= 1073741824) printf "%.1f GB", $1/1073741824
  else if ($1 >= 1048576) printf "%.1f MB", $1/1048576
  else if ($1 >= 1024) printf "%.1f KB", $1/1024
  else printf "%d B", $1
}')

echo "Free space after:  $(free_space_human)"
echo "Total freed:       $TOTAL_HUMAN"
echo ""
echo "✅ Nuke complete"
