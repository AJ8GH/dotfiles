#!/bin/bash

# macOS Storage Report
# Reports sizes of directories that are safe to clean up

dir_size_gb() {
  local path=$1
  if [ ! -d "$path" ]; then
    echo "0.00 GB"
    return
  fi
  du -sk "$path" 2>/dev/null | awk '{printf "%.2f GB", $1 / 1048576}'
}

item_count() {
  local path=$1
  if [ ! -d "$path" ]; then
    echo "0"
    return
  fi
  find "$path" -mindepth 1 2>/dev/null | wc -l | tr -d ' '
}

report() {
  local label=$1
  local path=$2
  local size count
  size=$(dir_size_gb "$path")
  count=$(item_count "$path")
  printf "%-40s %10s  (%s items)\n" "$label" "$size" "$count"
}

echo "📊 macOS Storage Report"
echo "========================"
echo ""
echo "Free space: $(diskutil info / | awk '/Free Space/ {print $4, $5}')"
echo ""

echo "── User Caches & Logs ──────────────────────────────────"
report "~/Library/Caches"          ~/Library/Caches
report "~/Library/Logs"            ~/Library/Logs
echo ""

echo "── Xcode ───────────────────────────────────────────────"
report "Xcode app"                 /Applications/Xcode.app
report "DerivedData"               ~/Library/Developer/Xcode/DerivedData
report "Archives"                  ~/Library/Developer/Xcode/Archives
report "iOS Device Logs"           ~/Library/Developer/Xcode/iOS\ Device\ Logs
report "Simulators"                ~/Library/Developer/CoreSimulator/Devices
report "Xcode Caches"              ~/Library/Caches/com.apple.dt.Xcode
echo ""

echo "── Trash ───────────────────────────────────────────────"
report "Trash"                     ~/.Trash
echo ""

echo "── Top 10 largest directories in ~ ─────────────────────"
du -sk ~/* 2>/dev/null | sort -rn | head -10 | awk '{printf "%-40s %10.2f GB\n", $2, $1 / 1048576}'
echo ""

echo "✅ Report complete"
