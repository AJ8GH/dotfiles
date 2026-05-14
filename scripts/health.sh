#!/bin/sh
# health.sh — Dev environment health check

# ─────────────────────────────────────────────
# Helpers
# ─────────────────────────────────────────────

check() {
  local label=$1
  local cmd=$2
  local version_cmd=$3

  if command -v "$cmd" >/dev/null 2>&1; then
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
check      "Java"         "java"    "java --version"
check      "Kotlin"       "kotlin"  "kotlin -version"
check      "Lua"          "lua"     "lua -v"
echo ""

echo "── Package Managers ────────────────────────────────────"
check      "npm"          "npm"     "npm --version"
check      "pip"          "pip3"    "pip3 --version"
check      "brew"         "brew"    "brew --version"
check      "gradle"       "gradle"  "gradle --version | grep '^Gradle'"
check      "maven"        "mvn"     "mvn --version"
echo ""

echo "── Tools ───────────────────────────────────────────────"
check      "git"          "git"     "git --version"
check      "docker"       "docker"  "docker --version"
check      "kubectl"      "kubectl" "kubectl version --client 2>/dev/null | head -1"
check      "terraform"    "terraform" "terraform --version"
check      "make"         "make"    "make --version"
check      "jq"           "jq"      "jq --version"
check      "curl"         "curl"    "curl --version"
check      "aws"          "aws"     "aws --version"
check      "zsh"          "zsh"     "zsh --version"
if [ -d "$HOME/.oh-my-zsh" ]; then
  OMZ_VERSION=$(cd "$HOME/.oh-my-zsh" && git log --oneline -1 2>/dev/null | awk '{print $1}' || echo "installed")
  printf "✅  %-20s %s\n" "oh-my-zsh" "$OMZ_VERSION"
else
  printf "❌  %-20s not installed\n" "oh-my-zsh"
fi
if [ -d "$HOME/.sdkman" ]; then
  SDKMAN_VERSION=$(cat "$HOME/.sdkman/var/version" 2>/dev/null || echo "installed")
  printf "✅  %-20s %s\n" "sdkman" "$SDKMAN_VERSION"
else
  printf "❌  %-20s not installed\n" "sdkman"
fi
XCODE_VERSION=$(xcode-select -p >/dev/null 2>&1 && pkgutil --pkg-info=com.apple.pkg.CLTools_Executables 2>/dev/null | awk '/version:/ {print $2}')
if [ -n "$XCODE_VERSION" ]; then
  printf "✅  %-20s %s\n" "Xcode CLI tools" "$XCODE_VERSION"
else
  printf "❌  %-20s not installed\n" "Xcode CLI tools"
fi
echo ""

echo "── IDEs & Editors ──────────────────────────────────────"
check_path "IntelliJ"  "$HOME/Applications/IntelliJ IDEA.app" "/usr/libexec/PlistBuddy -c 'Print CFBundleShortVersionString' '$HOME/Applications/IntelliJ IDEA.app/Contents/Info.plist'"
check_path "VS Code"   "/Applications/Visual Studio Code.app" "code --version"
CURSOR_VERSION=$(/usr/libexec/PlistBuddy -c "Print CFBundleShortVersionString" /Applications/Cursor.app/Contents/Info.plist 2>/dev/null)
if [ -n "$CURSOR_VERSION" ]; then
  printf "✅  %-20s %s\n" "Cursor" "$CURSOR_VERSION"
else
  printf "❌  %-20s not found\n" "Cursor"
fi
check      "vim"       "vim"   "vim --version"
check      "neovim"    "nvim"  "nvim --version"
echo ""

echo "── System ──────────────────────────────────────────────"
printf "✅  %-20s %s\n" "macOS" "$(sw_vers -productVersion)"
printf "✅  %-20s %s\n" "Free space" "$(diskutil info / | awk '/Free Space/ {print $4, $5}')"
printf "✅  %-20s %s\n" "RAM" "$(system_profiler SPHardwareDataType 2>/dev/null | awk '/Memory:/ {print $2, $3}')"
echo ""

echo "✅ Health check complete"