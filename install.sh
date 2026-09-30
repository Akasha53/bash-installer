#!/usr/bin/env bash
set -euo pipefail

PACKAGE="${1:-tree}"

echo "Starting installation..."
if command -v apt-get >/dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get install -y "$PACKAGE"
elif command -v brew >/dev/null 2>&1; then
    brew update
    brew install "$PACKAGE"
else
    echo "No supported package manager (apt-get or brew) found." >&2
    exit 1
fi
echo "Installation complete!"
