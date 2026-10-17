#!/usr/bin/env bash
# Cursor cloud Build step (idempotent; safe to rerun). Installs only what the repo declares.
set -euo pipefail
cd "$(dirname "$0")/.."
command -v python3 >/dev/null && python3 --version
if [ -f package-lock.json ]; then npm ci --no-audit --no-fund
elif [ -f package.json ]; then npm install --no-audit --no-fund; fi
if [ -f requirements.txt ]; then python3 -m pip install --user -r requirements.txt; fi
echo "cloud-install: ok"
