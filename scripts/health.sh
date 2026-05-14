#!/bin/bash
# health.sh — Dev environment health check

# ─────────────────────────────────────────────
# Helpers
# ─────────────────────────────────────────────

check() {
  local label=$1
  local cmd=$2
  local version_cmd=$3

  if command -v "$cmd" &>/dev/null; then
    local version
    version=$(eval "$version_cmd" 2>/dev/null | head -1)
    printf "✅  %-20s %s\n" "$label" "$version"
  else
    printf "❌  %-20s not installed\n" "$label"
  fi
}

check_path() {
  local label=$1
  local path=$2
  local version_cmd=$3

  if [ -e "$path" ]; then
    local version
    version=$(eval "$version_cmd" 2>/dev/null | head -1)
    printf "✅  %-20s %s\n" "$label" "$version"
  else
    printf "❌  %-20s not found\n" "$label"
  fi
}

# ─────────────────────────────────────────────
# Report
# ─────────────────────────────────────────────

echo "🏥 Dev Environment Health Check"
echo "================================"
echo ""

echo "── Languages ───────────────────────────────────────────"
check      "Go"           "go"      "go version"
check      "Node"         "node"    "node --version"
check      "Python"       "python3" "python3 --version"
check      "Ruby"         "ruby"    "ruby --version"
check      "Rust"         "rustc"   "rustc --version"
echo ""

echo "── Package Managers ────────────────────────────────────"
check      "npm"          "npm"     "npm --version"
check      "yarn"         "yarn"    "yarn --version"
check      "pnpm"         "pnpm"    "pnpm --version"
check      "pip"          "pip3"    "pip3 --version"
check      "brew"         "brew"    "brew --version"
echo ""

echo "── Tools ───────────────────────────────────────────────"
check      "git"          "git"     "git --version"
check      "docker"       "docker"  "docker --version"
check      "kubectl"      "kubectl" "kubectl version --client --short 2>/dev/null"
check      "terraform"    "terraform" "terraform --version"
check      "make"         "make"    "make --version"
check      "jq"           "jq"      "jq --version"
check      "curl"         "curl"    "curl --version"
check      "wget"         "wget"    "wget --version"
echo ""

echo "── IDEs & Editors ──────────────────────────────────────"
check_path "IntelliJ"     "/Applications/IntelliJ IDEA.app"        "echo installed"
check_path "IntelliJ CE"  "/Applications/IntelliJ IDEA CE.app"     "echo installed"
check_path "GoLand"       "/Applications/GoLand.app"               "echo installed"
check_path "VS Code"      "/Applications/Visual Studio Code.app"   "code --version"
check_path "Cursor"       "/Applications/Cursor.app"               "echo installed"
echo ""

echo "── System ──────────────────────────────────────────────"
printf "✅  %-20s %s\n" "macOS" "$(sw_vers -productVersion)"
printf "✅  %-20s %s\n" "Free space" "$(diskutil info / | awk '/Free Space/ {print $4, $5}')"
printf "✅  %-20s %s\n" "RAM" "$(system_profiler SPHardwareDataType 2>/dev/null | awk '/Memory:/ {print $2, $3}')"
echo ""

echo "✅ Health check complete"
