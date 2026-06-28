#!/usr/bin/env bash
# VPS Readiness Check — ENISHI-LAB Website Deploy
# Usage:  bash vps-readiness-check.sh
# Rights: Read-only — このスクリプトは VPS ファイルを変更しない
#
# Run on mgx-prod-01:
#   bash vps-readiness-check.sh
# Or via ssh:
#   ssh <user>@<host> "bash -s" < scripts/vps-readiness-check.sh

DIVIDER="────────────────────────────────────────"
NGINX_INSTALLED=0
NAMES=()
STATUSES=()
FAIL_COUNT=0
WARN_COUNT=0

add_result() {
  local name="$1" status="$2"
  NAMES+=("$name")
  STATUSES+=("$status")
  [ "$status" = "FAIL" ] && FAIL_COUNT=$((FAIL_COUNT + 1))
  [ "$status" = "WARN" ] && WARN_COUNT=$((WARN_COUNT + 1))
}

echo "=================================================="
echo "  VPS READINESS CHECK — ENISHI-LAB Website"
echo "  Timestamp: $(date)"
echo "=================================================="

# ── 1. OS / System ──────────────────────────────────
echo ""
echo "## 1. OS / System"
echo "$DIVIDER"
uname -a
if command -v lsb_release &>/dev/null; then
  lsb_release -a 2>/dev/null
elif [ -f /etc/os-release ]; then
  cat /etc/os-release
fi
add_result "OS Info" "PASS"

# ── 2. nginx インストール確認 ────────────────────────
echo ""
echo "## 2. nginx Installation"
echo "$DIVIDER"
if command -v nginx &>/dev/null; then
  nginx -v 2>&1
  NGINX_INSTALLED=1
  add_result "nginx installed" "PASS"
else
  echo "nginx: NOT FOUND"
  add_result "nginx installed" "WARN"
fi

# ── 3. nginx 稼働状態 ────────────────────────────────
echo ""
echo "## 3. nginx Status"
echo "$DIVIDER"
if systemctl is-active --quiet nginx 2>/dev/null; then
  echo "nginx: ACTIVE"
  add_result "nginx running" "PASS"
elif [ "$NGINX_INSTALLED" -eq 1 ]; then
  systemctl status nginx --no-pager -l 2>/dev/null || true
  echo "nginx: INACTIVE (installed but not running)"
  add_result "nginx running" "WARN"
else
  echo "nginx: N/A (not installed)"
  add_result "nginx running" "WARN"
fi

# ── 4. Virtual Host ディレクトリ ─────────────────────
echo ""
echo "## 4. nginx Virtual Hosts"
echo "$DIVIDER"
if [ -d /etc/nginx/sites-available ]; then
  echo "--- sites-available ---"
  ls -la /etc/nginx/sites-available/
  echo "--- sites-enabled ---"
  ls -la /etc/nginx/sites-enabled/ 2>/dev/null || echo "(sites-enabled not found)"
  add_result "nginx virtual hosts dir" "PASS"
elif [ -d /etc/nginx/conf.d ]; then
  echo "--- conf.d ---"
  ls -la /etc/nginx/conf.d/
  add_result "nginx virtual hosts dir" "PASS"
else
  echo "Standard nginx config directory not found"
  add_result "nginx virtual hosts dir" "WARN"
fi

# ── 5. ポート 80/443 使用状況 ─────────────────────────
echo ""
echo "## 5. Port Usage (80 / 443)"
echo "$DIVIDER"
if command -v ss &>/dev/null; then
  ss -tlnp 2>/dev/null | grep -E ':80 |:443 ' \
    || echo "(nothing listening on port 80/443)"
else
  netstat -tlnp 2>/dev/null | grep -E ':80 |:443 ' \
    || echo "(nothing listening on port 80/443)"
fi
add_result "Port 80/443 (informational)" "PASS"

# ── 6. /var/www/ 構成 ────────────────────────────────
echo ""
echo "## 6. /var/www/ Contents"
echo "$DIVIDER"
if [ -d /var/www ]; then
  ls -la /var/www/
  add_result "/var/www/ exists" "PASS"
else
  echo "/var/www/ not found — will need to be created"
  add_result "/var/www/ exists" "WARN"
fi

# ── 7. enishi-lab.com 競合チェック ───────────────────
echo ""
echo "## 7. enishi-lab Conflict Check"
echo "$DIVIDER"
ENISHI_HITS=$(grep -r "enishi" /etc/nginx/ 2>/dev/null | wc -l)
if [ "$ENISHI_HITS" -gt 0 ]; then
  echo "NOTICE: Existing enishi references in nginx (${ENISHI_HITS} lines):"
  grep -r "enishi" /etc/nginx/ 2>/dev/null || true
  add_result "enishi-lab conflict" "WARN"
else
  echo "No enishi references in nginx — safe to add virtual host"
  add_result "enishi-lab conflict" "PASS"
fi

# ── 8. SSL / certbot ─────────────────────────────────
echo ""
echo "## 8. SSL / certbot"
echo "$DIVIDER"
if command -v certbot &>/dev/null; then
  certbot --version 2>&1
  echo "Existing certs:"
  ls -la /etc/letsencrypt/live/ 2>/dev/null || echo "(no certs yet)"
  add_result "certbot installed" "PASS"
else
  echo "certbot: NOT INSTALLED"
  echo "(Cloudflare proxy may be used instead — confirm SSL strategy)"
  add_result "certbot installed" "WARN"
fi

# ── 9. ディスク容量 ──────────────────────────────────
echo ""
echo "## 9. Disk Space"
echo "$DIVIDER"
df -h
if df /var/www &>/dev/null; then
  USE_PCT=$(df /var/www | tail -1 | awk '{print $5}' | tr -d '%')
else
  USE_PCT=$(df / | tail -1 | awk '{print $5}' | tr -d '%')
fi
USE_PCT=${USE_PCT:-0}
if [ "$USE_PCT" -ge 90 ]; then
  echo "DISK CRITICAL: ${USE_PCT}% used — deploy will likely fail"
  add_result "Disk space (<90%)" "FAIL"
elif [ "$USE_PCT" -ge 75 ]; then
  echo "DISK WARNING: ${USE_PCT}% used — monitor before deploying"
  add_result "Disk space (<90%)" "WARN"
else
  echo "Disk space OK: ${USE_PCT}% used"
  add_result "Disk space (<90%)" "PASS"
fi

# ── 10. ユーザー・sudo 権限 ──────────────────────────
echo ""
echo "## 10. User & Permissions"
echo "$DIVIDER"
echo "User:   $(whoami)"
echo "Groups: $(groups)"
id
if sudo -n true 2>/dev/null; then
  echo "sudo: available (passwordless)"
  add_result "sudo access" "PASS"
else
  echo "sudo: password required or not configured"
  echo "(deploy user will need: sudo systemctl reload nginx)"
  add_result "sudo access" "WARN"
fi

# ── 11. UFW ──────────────────────────────────────────
echo ""
echo "## 11. UFW Firewall"
echo "$DIVIDER"
if command -v ufw &>/dev/null; then
  UFW_OUT=$(ufw status verbose 2>/dev/null \
            || ufw status 2>/dev/null \
            || echo "ufw status unavailable")
  echo "$UFW_OUT"
  if echo "$UFW_OUT" | grep -qiE "80|443|http|nginx"; then
    add_result "UFW 80/443 open" "PASS"
  else
    echo "NOTE: Could not confirm 80/443 are open — verify manually"
    add_result "UFW 80/443 open" "WARN"
  fi
else
  echo "ufw not found — firewall may be managed by iptables or cloud provider"
  add_result "UFW 80/443 open" "WARN"
fi

# ── 12. MGX nginx config (read-only) ─────────────────
echo ""
echo "## 12. MGX Config (mgx-poker.com)"
echo "$DIVIDER"
MGX_CONFIG_FILE=""
for candidate in \
  /etc/nginx/sites-available/mgx-poker.com \
  /etc/nginx/sites-available/mgx \
  /etc/nginx/conf.d/mgx-poker.com.conf \
  /etc/nginx/conf.d/mgx.conf; do
  if [ -f "$candidate" ]; then
    MGX_CONFIG_FILE="$candidate"
    break
  fi
done

if [ -n "$MGX_CONFIG_FILE" ]; then
  echo "MGX config found: $MGX_CONFIG_FILE"
  cat "$MGX_CONFIG_FILE"
  add_result "MGX config readable" "PASS"
else
  echo "MGX config not found at standard paths"
  echo "Identify the config file from the sites-available listing in section 4"
  add_result "MGX config readable" "WARN"
fi

# ── 13. Deploy path 確認 ─────────────────────────────
echo ""
echo "## 13. Deploy Path (/var/www/enishi-lab/)"
echo "$DIVIDER"
if [ -d /var/www/enishi-lab ]; then
  echo "NOTICE: /var/www/enishi-lab/ already exists"
  ls -la /var/www/enishi-lab/
  add_result "Deploy path /var/www/enishi-lab/" "WARN"
else
  echo "/var/www/enishi-lab/ does not exist — safe to create"
  add_result "Deploy path /var/www/enishi-lab/" "PASS"
fi

# ══════════════════════════════════════════════════════
# READINESS SUMMARY
# ══════════════════════════════════════════════════════
echo ""
echo "══════════════════════════════════════════"
echo "  READINESS SUMMARY"
echo "══════════════════════════════════════════"
echo ""

for i in "${!NAMES[@]}"; do
  printf "  %-44s [%s]\n" "${NAMES[$i]}" "${STATUSES[$i]}"
done

PASS_COUNT=$(( ${#NAMES[@]} - FAIL_COUNT - WARN_COUNT ))
echo ""
echo "$DIVIDER"
printf "  PASS: %-4s WARN: %-4s FAIL: %s\n" \
  "$PASS_COUNT" "$WARN_COUNT" "$FAIL_COUNT"
echo "$DIVIDER"

if [ "$FAIL_COUNT" -gt 0 ]; then
  echo ""
  echo "  Overall:"
  echo "  NOT READY"
  echo ""
  echo "  FAIL 項目を解消してから次 Sprint へ進んでください。"
else
  echo ""
  echo "  Overall:"
  echo "  READY"
  echo ""
  echo "  このログを次セッションに貼り付けて nginx 設定 Sprint へ進んでください。"
fi
echo "══════════════════════════════════════════"
