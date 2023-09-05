#!/usr/bin/env sh
set -xe

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

