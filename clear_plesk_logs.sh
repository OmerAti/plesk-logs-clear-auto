#!/bin/bash
#
# Plesk Log Cleaner
# https://github.com/OmerAti/plesk-logs-clear-auto
#

set -euo pipefail

LOG_ROOT="/var/www/vhosts"

echo "========================================"
echo " Plesk Log Cleaner"
echo "========================================"

find "$LOG_ROOT" -mindepth 2 -maxdepth 2 -type d -name "logs" -print0 | while IFS= read -r -d '' LOGDIR
do
    echo "[+] Cleaning: $LOGDIR"

    find "$LOGDIR" -mindepth 1 -maxdepth 1 -exec rm -rf -- {} +

done

echo
echo "Finished successfully."
