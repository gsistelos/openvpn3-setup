# openvpn3-setup

## The problem

On CachyOS + KDE, OpenVPN + Microsoft SSO interactive browser auth won't work in the native NetworkManager flow.

`openvpn3-setup` solves this by managing OpenVPN3 profiles and exposing a KDE-friendly workflow through CLI commands and generated `.desktop` launchers.

## How it works

- installs a local CLI: `openvpn3-setup`
- `openvpn3-setup add <.ovpn-file> <profile-name>` imports the `.ovpn` profile and binds to a profile name
- creates one KDE `.desktop` launcher per profile name
- supports connect/disconnect toggle from CLI and desktop launcher. CLI and desktop behave interoperable over the same OpenVPN3 session
- supports optional Firefox profile binding for SSO interactive browser auth
- sends notifications for connection status changes

## Install

Requires `openvpn3` and `libnotify`.

```bash
git clone https://github.com/gsistelos/openvpn3-setup.git
cd openvpn3-setup
./install.sh
```

Default install target is `~/.local/bin/openvpn3-setup`, that can be changed by passing an path as argument to the installer.

## Usage

### Add a VPN profile

```bash
openvpn3-setup add /path/to/company.ovpn company-work
```

### Connect or disconnect

CLI:

```bash
openvpn3-setup connect company-work
openvpn3-setup disconnect company-work
openvpn3-setup toggle company-work
```

Desktop:
- launch `VPN company-work` from an app launcher
- running again toggles disconnect

Interop behavior:
- connect in CLI, disconnect in desktop works
- connect in desktop, disconnect in CLI works

### Check status and list profiles

```bash
openvpn3-setup status company-work
openvpn3-setup list
```

### Remove profile

```bash
openvpn3-setup remove company-work
```

## Firefox Profile Binding (Optional)

If you use multiple Microsoft accounts, bind a VPN profile to a Firefox profile path:

```bash
openvpn3-setup set-firefox-profile company-work /path/to/firefox/profile
```

Clear binding:

```bash
openvpn3-setup clear-firefox-profile company-work
```
