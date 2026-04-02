#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"

TARGET_DIR="${1:-$HOME/.local/bin}"
TARGET_CMD="$TARGET_DIR/openvpn3-setup"

mkdir -p "$TARGET_DIR"
install -m 0755 "$ROOT_DIR/bin/openvpn3-setup" "$TARGET_CMD"

echo "Installed: $TARGET_CMD"

if ! printf '%s' "$PATH" | tr ':' '\n' | grep -Fxq "$TARGET_DIR"; then
  echo ""
  echo "Add $TARGET_DIR to your \$PATH."
fi

echo ""
echo "Next steps:"
echo "  1) openvpn3-setup add /path/to/profile.ovpn <name-of-profile>"
echo "  2) openvpn3-setup set-firefox-profile <name-of-profile> /path/to/firefox/profile"
echo "  3) toggle the VPN profile using the app launcher 'VPN <name-of-profile>' (or run: openvpn3-setup toggle <name-of-profile>)"
