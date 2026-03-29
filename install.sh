#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

ROOT_DIR="$(pwd)"

TARGET_DIR="${1:-$HOME/.local/bin}"
TARGET_CMD="$TARGET_DIR/openvpn3-setup"

mkdir -p "$TARGET_DIR"
install -m 0755 "$ROOT_DIR/bin/openvpn3-setup" "$TARGET_CMD"

echo "Installed: $TARGET_CMD"

if ! printf '%s' "$PATH" | tr ':' '\n' | grep -Fxq "$TARGET_DIR"; then
  echo ""
  echo "Add $TARGET_DIR to PATH."
fi

echo ""
echo "Next steps:"
echo "  1) openvpn3-setup add /path/to/profile.ovpn <name-of-profile>"
echo "  2) launch the generated KDE app entry (or run: openvpn3-setup toggle <name-of-profile>)"
