#!/bin/bash
# ports.sh — Show what's running on which ports

# ─────────────────────────────────────────────
# Helpers
# ─────────────────────────────────────────────

filter=${1:-""}

# ─────────────────────────────────────────────
# Report
# ─────────────────────────────────────────────

echo "🔌 Active Listening Ports"
echo "========================="
echo ""

if [ -n "$filter" ]; then
  echo "Filtering by: $filter"
  echo ""
fi

printf "%-8s %-30s %-20s %s\n" "PORT" "PROCESS" "PID" "ADDRESS"
echo "──────────────────────────────────────────────────────────────────"

lsof -iTCP -sTCP:LISTEN -P -n 2>/dev/null | tail -n +2 | while read -r line; do
  pid=$(echo "$line" | awk '{print $2}')
  process=$(echo "$line" | awk '{print $1}')
  address=$(echo "$line" | awk '{print $9}')
  port=$(echo "$address" | awk -F: '{print $NF}')

  if [ -n "$filter" ]; then
    if ! echo "$process $port $address" | grep -qi "$filter"; then
      continue
    fi
  fi

  printf "%-8s %-30s %-20s %s\n" "$port" "$process" "$pid" "$address"
done | sort -n

echo ""

# ─────────────────────────────────────────────
# Common ports reference
# ─────────────────────────────────────────────

echo "── Common ports reference ──────────────────────────────"
printf "%-8s %s\n" "3000"  "React / Next.js dev server"
printf "%-8s %s\n" "4000"  "GraphQL / misc dev servers"
printf "%-8s %s\n" "5432"  "PostgreSQL"
printf "%-8s %s\n" "5433"  "PostgreSQL (alternate)"
printf "%-8s %s\n" "6379"  "Redis"
printf "%-8s %s\n" "8080"  "HTTP alternate / Spring Boot"
printf "%-8s %s\n" "8443"  "HTTPS alternate"
printf "%-8s %s\n" "9090"  "Prometheus"
printf "%-8s %s\n" "9200"  "Elasticsearch"
printf "%-8s %s\n" "27017" "MongoDB"
echo ""
echo "💡 Tip: run with a filter e.g. ./ports.sh 8080"
echo ""
echo "✅ Done"
