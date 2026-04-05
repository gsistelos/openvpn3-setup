#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd -P)"

TARGET_CLI_DIR="${1:-$HOME/.local/bin}"
TARGET_OPENVPN3_SETUP_CLI="$TARGET_CLI_DIR/openvpn3-setup"

missing_required=()
for command_name in openvpn3 notify-send jq; do
  if ! command -v "$command_name" >/dev/null 2>&1; then
    missing_required+=("$command_name")
  fi
done

if [[ "${#missing_required[@]}" -gt 0 ]]; then
  echo "Missing required dependencies: ${missing_required[*]}" >&2
  echo "Install the missing commands and run the installer again." >&2
  exit 1
fi

mkdir -p "$TARGET_CLI_DIR"
install -m 0755 "$ROOT_DIR/bin/openvpn3-setup" "$TARGET_OPENVPN3_SETUP_CLI"

echo "Installed: $TARGET_OPENVPN3_SETUP_CLI"

if ! printf '%s' "$PATH" | tr ':' '\n' | grep -Fxq "$TARGET_CLI_DIR"; then
  echo ""
  echo "Add $TARGET_CLI_DIR to your \$PATH."
fi

echo ""
echo "Next steps:"
echo "  1) openvpn3-setup add /path/to/profile.ovpn <name-of-profile>"
echo "  2) openvpn3-setup set-firefox-profile <name-of-profile> /path/to/firefox/profile"
echo "  3) toggle the VPN profile using the app launcher 'VPN <name-of-profile>' (or run: openvpn3-setup toggle <name-of-profile>)"
