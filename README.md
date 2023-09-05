Install and setup of my Hetzner servers using NixOS and nixos-infect.

- https://github.com/elitak/nixos-infect

Install "infect" Ubuntu with NixOS.

```bash
curl https://raw.githubusercontent.com/elitak/nixos-infect/master/nixos-infect | NIX_CHANNEL=nixos-22.11 bash -x
```

Setup or update my NixOS configuration

```bash
nix-shell -p git --run "git clone 'https://github.com/nilsherzig/hetzner-nixos-install'" "$HOME"
ln -sf "$HOME/hetzner-nixos-install/configuration.nix" "/etc/nixos/configuration.nix"
bash "$HOME/hetzner-nixos-install/update.sh"
```

After that update by running the `update` command. 
