Install and setup of my Hetzner servers using NixOS and nixos-infect.

- https://github.com/elitak/nixos-infect

Install "infect" Ubuntu with NixOS.

```bash
curl https://raw.githubusercontent.com/elitak/nixos-infect/master/nixos-infect | NIX_CHANNEL=nixos-22.11 bash -x
```

Setup or update my NixOS configuration

```bash
OLDPWD="$PWD"
DIR="$HOME/hetzner-nixos-install"
if [ -d "$DIR" ]; then
  cd "$DIR"
  nix-shell -p git --run "git pull"
else
  nix-shell -p git --run "git clone 'https://github.com/nilsherzig/hetzner-nixos-install'"
  ln -sf "$PWD/hetzner-nixos-install/configuration.nix" "/etc/nixos/configuration.nix"
fi
nixos-rebuild switch
cd "$OLDPWD"
```
