#!/usr/bin/env bash
set -euo pipefail

# Rebuild script for YOURLS/website
# Runs on existing source tree (no clone). Installs deps, runs pre-build steps, builds.

# --- Node version ---
# Docusaurus 3.9.2 requires Node 20+. CI uses lts/* (currently Node 22).
export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
if [ -s "$NVM_DIR/nvm.sh" ]; then
    # shellcheck source=/dev/null
    . "$NVM_DIR/nvm.sh"
    nvm install 22
    nvm use 22
fi

# --- Package manager + dependencies ---
# Uses npm (package-lock.json present)
npm ci

# --- Build ---
npx docusaurus build

echo "[DONE] Build complete."
