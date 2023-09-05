Install and setup of my Hetzner servers using NixOS and nixos-infect.

- https://github.com/elitak/nixos-infect

```bash
mkdir -p /etc/nixos/ 
curl https://raw.githubusercontent.com/nilsherzig/hetzner-nixos-install/main/configuration.nix -O /etc/nixos/configuration.nix
curl https://raw.githubusercontent.com/elitak/nixos-infect/master/nixos-infect | NIX_CHANNEL=nixos-22.11 bash -x
```
