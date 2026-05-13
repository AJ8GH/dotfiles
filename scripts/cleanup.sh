#!/bin/sh
# macOS Disk Cleanup Script
# Clears caches, logs, and Xcode artifacts

# ─────────────────────────────────────────────
# Helpers
# ─────────────────────────────────────────────

free_space_bytes() {
  df / | awk 'NR==2 {print $4}'
}

free_space_human() {
  diskutil info / | awk '/Free Space/ {print $4, $5}'
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

# ─────────────────────────────────────────────
# Start
# ─────────────────────────────────────────────

echo "🧹 Starting macOS cleanup..."
echo ""
echo "Free space before: $(free_space_human)"
echo ""
BEFORE=$(free_space_bytes)

# ─────────────────────────────────────────────
# Caches & Logs
# ─────────────────────────────────────────────

clean "~/Library/Caches"   ~/Library/Caches
clean "~/Library/Logs"     ~/Library/Logs
clean "Trash"              ~/.Trash

# ─────────────────────────────────────────────
# Xcode
# ─────────────────────────────────────────────

clean "Xcode DerivedData"      ~/Library/Developer/Xcode/DerivedData
clean "Xcode Archives"         ~/Library/Developer/Xcode/Archives
clean "Xcode iOS Device Logs"  ~/Library/Developer/Xcode/iOS\ Device\ Logs

SIM_DIR="$HOME/Library/Developer/CoreSimulator/Devices"
if [ -d "$SIM_DIR" ]; then
  echo "Clearing all Xcode simulators..."
  before=$(free_space_bytes)
  rm -rf "$SIM_DIR"/* 2>/dev/null
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

# ─────────────────────────────────────────────
# Go
# ─────────────────────────────────────────────

if command -v go &>/dev/null; then
  echo "Clearing Go module cache..."
  before=$(free_space_bytes)
  go clean -modcache 2>/dev/null
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

# ─────────────────────────────────────────────
# Docker
# ─────────────────────────────────────────────

if command -v docker &>/dev/null; then
  echo "Pruning Docker (stopped containers, dangling images, unused networks)..."
  before=$(free_space_bytes)
  rm -rf ~/Library/Containers/com.docker.docker/Data/log/* 2>/dev/null
  rm -f ~/Library/Containers/com.docker.docker/Data/default.profraw 2>/dev/null
  if docker info &>/dev/null 2>&1; then
    docker system prune -f 2>/dev/null
  else
    echo "  (Docker daemon not running, skipping prune)"
  fi
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

# ─────────────────────────────────────────────
# JetBrains
# ─────────────────────────────────────────────

JETBRAINS_DIR="$HOME/Library/Application Support/JetBrains"
if [ -d "$JETBRAINS_DIR" ]; then
  echo "Clearing old JetBrains IDE directories..."
  before=$(free_space_bytes)
  for product in IdeaIC IntelliJIdea GoLand Rider WebStorm PyCharm Fleet RubyMine CLion DataGrip PhpStorm; do
    latest=$(ls -d "$JETBRAINS_DIR/$product"* 2>/dev/null | sort -V | tail -1)
    for dir in "$JETBRAINS_DIR/$product"*; do
      if [ -d "$dir" ] && [ "$dir" != "$latest" ]; then
        echo "  Removing $(basename "$dir")..."
        rm -rf "$dir"
      fi
    done
  done
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
echo "✅ Cleanup complete"
