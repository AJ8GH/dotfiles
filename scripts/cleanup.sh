#!/bin/sh

# macOS Disk Cleanup Script
# Clears caches, logs, and Xcode artifacts

free_space_bytes() {
  df / | awk 'NR==2 {print $4}'
}

free_space_human() {
  df -h / | awk 'NR==2 {print $4}'
}

clean() {
  local label=$1
  local target=$2

  if [ ! -d "$target" ] && [ ! -f "$target" ]; then
    return
  fi

  echo "Clearing $label..."

  local count before after freed
  count=$(find "$target" -mindepth 1 2>/dev/null | wc -l | tr -d ' ')
  before=$(free_space_bytes)

  rm -rf "${target:?}"/* 2>/dev/null

  after=$(free_space_bytes)
  freed=$(( (after - before) * 512 ))

  if [ "$freed" -gt 0 ]; then
    freed_human=$(echo "$freed" | awk '{
      if ($1 >= 1073741824) printf "%.1f GB", $1/1073741824
      else if ($1 >= 1048576) printf "%.1f MB", $1/1048576
      else if ($1 >= 1024) printf "%.1f KB", $1/1024
      else printf "%d B", $1
    }')
    echo "✓ Removed $count items, freed $freed_human"
  else
    echo "✓ Removed $count items, freed 0 B"
  fi
  echo ""
}

echo "🧹 Starting macOS cleanup..."
echo ""
echo "Free space before: $(free_space_human)"
echo ""

BEFORE=$(free_space_bytes)

clean "~/Library/Caches"                              ~/Library/Caches
clean "~/Library/Logs"                                ~/Library/Logs
clean "Xcode DerivedData"                             ~/Library/Developer/Xcode/DerivedData
clean "Xcode Archives"                                ~/Library/Developer/Xcode/Archives
clean "Xcode iOS Device Logs"                         ~/Library/Developer/Xcode/iOS\ Device\ Logs
clean "Trash"                                         ~/.Trash

if command -v xcrun &>/dev/null; then
  echo "Clearing unavailable simulators..."
  before=$(free_space_bytes)
  xcrun simctl delete unavailable 2>/dev/null
  after=$(free_space_bytes)
  freed=$(( (after - before) * 512 ))
  if [ "$freed" -gt 0 ]; then
    freed_human=$(echo "$freed" | awk '{
      if ($1 >= 1073741824) printf "%.1f GB", $1/1073741824
      else if ($1 >= 1048576) printf "%.1f MB", $1/1048576
      else if ($1 >= 1024) printf "%.1f KB", $1/1024
      else printf "%d B", $1
    }')
    echo "✓ Freed $freed_human"
  else
    echo "✓ Freed 0 B"
  fi
  echo ""
fi

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
echo "✅ Cleanup complete"
