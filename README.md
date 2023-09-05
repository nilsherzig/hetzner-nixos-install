Install and setup of my Hetzner servers using NixOS and nixos-infect.

- https://github.com/elitak/nixos-infect

Install "infect" Ubuntu with NixOS.

```bash
curl https://raw.githubusercontent.com/elitak/nixos-infect/master/nixos-infect | NIX_CHANNEL=nixos-22.11 bash -x
```

Setup or update my NixOS configuration

```bash
curl 'https://raw.githubusercontent.com/nilsherzig/hetzner-nixos-install/main/update.sh' | bash -x
```

After that update by running the `update` command. 
