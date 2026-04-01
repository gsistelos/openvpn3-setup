# openvpn3-setup

## The problem

OpenVPN + Microsoft SSO interactive browser authentication won't work in the native NetworkManager flow.
Thankfully, `openvpn3` CLI solves this, but its interface is not very friendly.

`openvpn3-setup` is a wrapper around `openvpn3` to manage profiles in a better CLI interface and generated `.desktop` launchers.

You can also link a VPN profile to a Firefox profile path so the SSO authentication attempts to use it.

## Install

Requires `openvpn3` and `libnotify`.

```bash
git clone https://github.com/gsistelos/openvpn3-setup.git
cd openvpn3-setup
./install.sh
```

Default install location is `~/.local/bin/openvpn3-setup`, but it can be changed by passing a path as an argument to the installer.

## Usage

### Add a VPN profile

```bash
openvpn3-setup add /path/to/my-profile.ovpn my-profile
```

This will create a `.desktop` launcher that can be used to toggle the VPN profile on and off.

### Connect and disconnect

CLI:

```bash
openvpn3-setup connect my-profile
openvpn3-setup disconnect my-profile
# or
openvpn3-setup toggle my-profile
```

Desktop:
- launch `VPN my-profile` from an app launcher to toggle the VPN profile on and off

### Check status and list profiles

```bash
openvpn3-setup status my-profile
openvpn3-setup list
```

### Remove profile

```bash
openvpn3-setup remove my-profile
```

This will remove the `.desktop` launcher from the system.

## Firefox profile binding

If you use multiple Microsoft accounts, you can bind a VPN profile to a Firefox profile path:

```bash
openvpn3-setup set-firefox-profile my-profile /path/to/firefox/profile
```

Clear binding:

```bash
openvpn3-setup clear-firefox-profile my-profile
```
