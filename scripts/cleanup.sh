#!/bin/sh

# macOS Disk Cleanup Script
# Clears caches, logs, and Xcode artifacts

set -e

echo "🧹 Starting macOS cleanup..."
echo ""

free_space() {
  df -h / | awk 'NR==2 {print $4}'
}

BEFORE=$(free_space)
echo "Free space before: $BEFORE"
echo ""

# User caches
echo "Clearing ~/Library/Caches..."
rm -rf ~/Library/Caches/* 2>/dev/null && echo "✓ Done" || echo "⚠ Some files skipped"

# User logs
echo "Clearing ~/Library/Logs..."
rm -rf ~/Library/Logs/* 2>/dev/null && echo "✓ Done" || echo "⚠ Some files skipped"

# Xcode derived data
if [ -d ~/Library/Developer/Xcode/DerivedData ]; then
  echo "Clearing Xcode DerivedData..."
  rm -rf ~/Library/Developer/Xcode/DerivedData/* 2>/dev/null && echo "✓ Done" || echo "⚠ Some files skipped"
fi

# Xcode archives (comment out if you want to keep these)
if [ -d ~/Library/Developer/Xcode/Archives ]; then
  echo "Clearing Xcode Archives..."
  rm -rf ~/Library/Developer/Xcode/Archives/* 2>/dev/null && echo "✓ Done" || echo "⚠ Some files skipped"
fi

# Xcode iOS Device Logs
if [ -d ~/Library/Developer/Xcode/iOS\ Device\ Logs ]; then
  echo "Clearing Xcode iOS Device Logs..."
  rm -rf ~/Library/Developer/Xcode/iOS\ Device\ Logs/* 2>/dev/null && echo "✓ Done" || echo "⚠ Some files skipped"
fi

# Simulator devices (unused)
if command -v xcrun &>/dev/null; then
  echo "Clearing unavailable simulators..."
  xcrun simctl delete unavailable 2>/dev/null && echo "✓ Done" || echo "⚠ Skipped (Xcode not installed)"
fi

# Trash
echo "Emptying Trash..."
rm -rf ~/.Trash/* 2>/dev/null && echo "✓ Done" || echo "⚠ Some files skipped"

echo ""
AFTER=$(free_space)
echo "Free space after: $AFTER"
echo ""
echo "✅ Cleanup complete"
