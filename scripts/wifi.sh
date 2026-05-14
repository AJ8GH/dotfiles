#!/bin/bash
# wifi.sh — Network diagnostics

# ─────────────────────────────────────────────
# Helpers
# ─────────────────────────────────────────────

ping_host() {
  local host=$1
  local result
  result=$(ping -c 1 -W 1 "$host" 2>/dev/null | awk -F'/' 'END {print $5}')
  if [ -n "$result" ]; then
    echo "${result}ms"
  else
    echo "unreachable"
  fi
}

# ─────────────────────────────────────────────
# Report
# ─────────────────────────────────────────────

echo "📶 Network Diagnostics"
echo "======================"
echo ""

# ─────────────────────────────────────────────
# WiFi info
# ─────────────────────────────────────────────

echo "── WiFi ────────────────────────────────────────────────"
SSID=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I 2>/dev/null | awk '/ SSID/ {print $2}')
SIGNAL=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I 2>/dev/null | awk '/agrCtlRSSI/ {print $2}')
NOISE=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I 2>/dev/null | awk '/agrCtlNoise/ {print $2}')
CHANNEL=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I 2>/dev/null | awk '/channel/ {print $2}')
TX_RATE=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I 2>/dev/null | awk '/lastTxRate/ {print $2}')

printf "%-20s %s\n" "SSID:"    "${SSID:-unknown}"
printf "%-20s %s dBm\n" "Signal:"  "${SIGNAL:-unknown}"
printf "%-20s %s dBm\n" "Noise:"   "${NOISE:-unknown}"
printf "%-20s %s\n" "Channel:"  "${CHANNEL:-unknown}"
printf "%-20s %s Mbps\n" "TX Rate:"  "${TX_RATE:-unknown}"
echo ""

# ─────────────────────────────────────────────
# IP info
# ─────────────────────────────────────────────

echo "── IP ──────────────────────────────────────────────────"
LOCAL_IP=$(ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 2>/dev/null)
PUBLIC_IP=$(curl -s --max-time 3 https://api.ipify.org 2>/dev/null)
GATEWAY=$(netstat -nr 2>/dev/null | awk '/default/ && /en/ {print $2; exit}')

printf "%-20s %s\n" "Local IP:"   "${LOCAL_IP:-unknown}"
printf "%-20s %s\n" "Public IP:"  "${PUBLIC_IP:-unknown}"
printf "%-20s %s\n" "Gateway:"    "${GATEWAY:-unknown}"
echo ""

# ─────────────────────────────────────────────
# DNS
# ─────────────────────────────────────────────

echo "── DNS ─────────────────────────────────────────────────"
DNS_SERVERS=$(scutil --dns 2>/dev/null | awk '/nameserver/ {print $3}' | sort -u | head -3)
if [ -n "$DNS_SERVERS" ]; then
  echo "$DNS_SERVERS" | while read -r dns; do
    printf "%-20s %s\n" "Nameserver:" "$dns"
  done
else
  printf "%-20s %s\n" "Nameserver:" "unknown"
fi
echo ""

# ─────────────────────────────────────────────
# Latency
# ─────────────────────────────────────────────

echo "── Latency ─────────────────────────────────────────────"
printf "%-20s %s\n" "Gateway:"      "$(ping_host "${GATEWAY:-192.168.1.1}")"
printf "%-20s %s\n" "Google DNS:"   "$(ping_host 8.8.8.8)"
printf "%-20s %s\n" "Cloudflare:"   "$(ping_host 1.1.1.1)"
printf "%-20s %s\n" "google.com:"   "$(ping_host google.com)"
echo ""

echo "✅ Done"
