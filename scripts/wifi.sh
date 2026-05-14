#!/bin/sh
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
WIFI_DATA=$(system_profiler SPAirPortDataType 2>/dev/null)

# Name of the WiFi network you're connected to
# Requires verbose mode to be enabled once with: sudo ipconfig setverbose 1
# To revert: sudo ipconfig setverbose 0
# Will prompt for sudo password when run
SSID=$(sudo /usr/sbin/ipconfig getsummary en0 2>/dev/null | awk -F' : ' '/^  SSID / {print $2; exit}')

# Whether WiFi is connected or not
STATUS=$(echo "$WIFI_DATA" | awk '/Status:/ {print $2; exit}')

# Radio channel and band your router is using
# 5GHz = faster, shorter range; 2GHz = slower, longer range
# Wider channel (80MHz, 160MHz) = more throughput
CHANNEL=$(echo "$WIFI_DATA" | awk '/Current Network Information:/{found=1} found && /Channel:/{$1=""; sub(/^ /, ""); print; exit}')

# Signal strength from your router in dBm (decibel-milliwatts)
# Closer to 0 = stronger. Guide: -50 excellent, -60 good, -70 fair, -80+ poor
SIGNAL=$(echo "$WIFI_DATA" | awk '/Current Network Information:/{found=1} found && /Signal \/ Noise:/{print $4; exit}')

# Background radio interference in dBm. Want this as low (negative) as possible.
# What matters is the gap between signal and noise — bigger gap = cleaner connection
NOISE=$(echo "$WIFI_DATA" | awk '/Current Network Information:/{found=1} found && /Signal \/ Noise:/{print $7; exit}')

# Current transmit rate in Mbps — how fast your device is talking to the router
TX_RATE=$(echo "$WIFI_DATA" | awk '/Current Network Information:/{found=1} found && /Transmit Rate:/{print $3; exit}')

printf "%-20s %s\n"      "SSID:"    "${SSID:-unknown}"
printf "%-20s %s\n"      "Status:"  "${STATUS:-unknown}"
printf "%-20s %s\n"      "Channel:" "${CHANNEL:-unknown}"
printf "%-20s %s dBm\n"  "Signal:"  "${SIGNAL:-unknown}"
printf "%-20s %s dBm\n"  "Noise:"   "${NOISE:-unknown}"
printf "%-20s %s Mbps\n" "TX Rate:" "${TX_RATE:-unknown}"
echo ""

# ─────────────────────────────────────────────
# IP info
# ─────────────────────────────────────────────

echo "── IP ──────────────────────────────────────────────────"

# Your device's address on your local network, assigned by your router
LOCAL_IP=$(ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 2>/dev/null)

# Your external IP as seen by the internet, assigned by your ISP
PUBLIC_IP=$(curl -s --max-time 3 https://api.ipify.org 2>/dev/null)

# Your router's IP address on the local network
GATEWAY=$(netstat -nr 2>/dev/null | awk '/default/ && /en/ {print $2; exit}')

printf "%-20s %s\n" "Local IP:"   "${LOCAL_IP:-unknown}"
printf "%-20s %s\n" "Public IP:"  "${PUBLIC_IP:-unknown}"
printf "%-20s %s\n" "Gateway:"    "${GATEWAY:-unknown}"
echo ""

# ─────────────────────────────────────────────
# DNS
# ─────────────────────────────────────────────

echo "── DNS ─────────────────────────────────────────────────"
# DNS servers translate domain names (google.com) into IP addresses
# Often your router or ISP's servers, or a public resolver like 8.8.8.8 (Google) or 1.1.1.1 (Cloudflare)
scutil --dns 2>/dev/null | awk '/nameserver/ {print $3}' | sort -u | while read -r dns; do
  if echo "$dns" | grep -qE '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$'; then
    printf "%-20s %s\n" "Nameserver (IPv4):" "$dns"
  else
    printf "%-20s %s\n" "Nameserver (IPv6):" "$dns"
  fi
done
echo ""

# ─────────────────────────────────────────────
# Latency
# ─────────────────────────────────────────────

echo "── Latency ─────────────────────────────────────────────"
# Round trip time in milliseconds to reach each host — lower is better
# Gateway should be single digits on a healthy local network
# Google/Cloudflare under 20ms is excellent, under 50ms is fine
# google.com adds DNS resolution time on top of network latency
printf "%-20s %s\n" "Gateway:"      "$(ping_host "${GATEWAY:-192.168.1.1}")"
printf "%-20s %s\n" "Google DNS:"   "$(ping_host 8.8.8.8)"
printf "%-20s %s\n" "Cloudflare:"   "$(ping_host 1.1.1.1)"
printf "%-20s %s\n" "google.com:"   "$(ping_host google.com)"
echo ""

echo "── Speed ────────────────────────────────────────────────"
speedtest
echo ""

echo "✅ Done"
