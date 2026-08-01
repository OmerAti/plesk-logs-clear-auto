#!/bin/bash

set -euo pipefail

SCRIPT_NAME="clear_plesk_logs.sh"
TARGET="/root/$SCRIPT_NAME"
CRON_JOB="0 3 */3 * * $TARGET >/dev/null 2>&1"

echo "Installing..."

if [[ $EUID -ne 0 ]]; then
    echo "Please run as root."
    exit 1
fi

install -m755 "$SCRIPT_NAME" "$TARGET"

echo "Running first cleanup..."
"$TARGET"

echo "Installing cron..."

TMP=$(mktemp)

crontab -l 2>/dev/null > "$TMP" || true

if ! grep -Fq "$TARGET" "$TMP"; then
    echo "$CRON_JOB" >> "$TMP"
    crontab "$TMP"
    echo "Cron added."
else
    echo "Cron already exists."
fi

rm -f "$TMP"

echo "Done."
