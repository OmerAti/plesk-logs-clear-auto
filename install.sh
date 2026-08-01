#!/bin/bash

set -euo pipefail

SCRIPT_NAME="clear_plesk_logs.sh"
TARGET="/root/$SCRIPT_NAME"

echo "========================================"
echo " Installing Plesk Log Cleaner"
echo "========================================"

if [[ $EUID -ne 0 ]]; then
    echo "Please run as root."
    exit 1
fi

install -m 755 "$SCRIPT_NAME" "$TARGET"

echo
echo "[+] Running first cleanup..."
"$TARGET"

echo
echo "[+] Installing cron..."

CRON_JOB="0 3 */3 * * $TARGET >/dev/null 2>&1"

(
crontab -l 2>/dev/null | grep -v "$TARGET"
echo "$CRON_JOB"
) | crontab -

echo
echo "========================================"
echo " Installation Completed"
echo "========================================"

echo "Script : $TARGET"
echo "Cron   : Every 3 days at 03:00"
echo
