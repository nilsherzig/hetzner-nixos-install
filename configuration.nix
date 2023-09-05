{ pkgs, ... }: 
{
  imports = [
    /etc/nixos/hardware-configuration.nix
  ];

  boot.cleanTmpDir = true;
  zramSwap.enable = true;
  networking.hostName = "ubuntu-16gb-fsn1-1";
  networking.domain = "";
  services.openssh.enable = true;
  users.users.root.openssh.authorizedKeys.keys = [
    ''ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCF2Jqb4iSAEBV7AKfVefqzqmZTfFJ/Ab1DpKbW6UdHlT9xXw/U165eAeRQOcxuSfgy2HxOxvvtpcsU9FNSwRhol2nnhtY8kx9rdtQpZ7Lju/kUCi68VQZfq3rFFQas1U+u2R7OYHKt7I0TZWFzaepU8Yb2b6eQLQegm0t1L1jcOb962LbCal2SEJhPpFEwKCBuENQF7ivgDCTpLNtoKaYzVvPjR0+hMfQhdw8gCtWFIgxcBzC0cwe7qVQPGl+Q0AsVrbB92j3wWVc20FjJP7Ij8ZiwHaGPrJDiFnXepVQlzwPpqdR4bLNRqPmxxpTBkrZ53RGtWyhtFDcrygRCC3Q2PWcjYCx2EVKZR2OtXprqKxaF7bmYls2w1NDWPdqtBTjY0Sswz9cCj0U/avgc4bcISLS3rrrTwPKrkVVZH60qa1duTGyTANlAb9ul5IqTmzvnYgbSZw4/HTYc/xr1qj7JGbcTSWSvavvEH2ADruH78NQ/rJeUQdk5AxYrIXdviPs='' 
    ''ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCb1KXNu4DB/4nFu6W+CaXM2SCNTG5TCj47lRcZiLgi21OdcUIPZefkW8+AaXePfDyKJPpAa4dfCf6HskK71hfgkkozWv+BOUr7yxKh1Ay+PwcJWLNcFl0S8i/jgmm0SXTDT7qE/E3/5rCOjw5C1+GlOJVQZicb6H55Swdwoa54WYZ3OXcbuhJN6+WTeewZy863/HNqht6NwFC5jE+UaKX/2aCgmJoD/+RjNYxtd0dwiEBIPx8NKSfzyucwQuPzUUzA1YJAjBAHa2+9Wuh+Q25xXM7F4lcBjbVTPdWKmGBHbOHc2MooybwkZl+B423zVeOS5+SQZIiu93qcbiFFhwl0egr2erZwAwjFFl1LHQd+KXOJKDRQD0TaDsZPNl2nnG57oaeXsKBhHBp3XslvC/Mapll1p469aMKdaw6kylp/ltwtjGPHDqQEoB2O7IS0rDjYBbmYMRgkISpAHrNrqstdo/FY8cpgrvyPqlFBUU+GH1zYY1Ownj6/MDEM7Vgspb0='' 
    ''ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDO1tbzO7yn4mveUDm+kWMZWTzfvS9J13lwDAC2P1OxEzrPW/zUNhk+KEq2VVKZDeKnrJzDPGvg0+81fmqkSiEWie8tHLLplQEc5V/fx9Adbm26d/xbIhRklGsCg8Nk6+lAPorNzlbEMDjgC5RubTY4L6qIqQx3kARddSlCta7vuSO5NEtbdGj40LQzm5Hi3Zi0vn3sgdaI+YU1gqi7E+cs6FhVbfQhI8O9sXAbeu6wHETfBTi7DjRvPWaFMsh47YtlXhInqpc1U9a4mRqYOPRwzFWXxa5We8Wt5q0/E1r6WQJy/wOYUZslyKq//h5V8XMOVS/bq3Ymlxj+M5Z+aeZ6RQNtKLA7Nal1DmntW3QQYD9bxR3FsnJ8L0V9xpmPcLpnU83zpyyFo3DmBUPUqiUOhAWY05gwvTZfh2HwIRCW0xjMtaoXoljM9rs+9GXciLaafQfrXhvdQj7EVI5lEZDLfjbU8Vhji64A6932RLS5qdoHvaoqnB108wrGqDPCxsk='' 
  ];

  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    zoxide
    fzf 
    direnv
    lazydocker
    lazygit
    helix
    kubectl
    docker
    docker-compose
    clusterctl
    kind
    zsh 
    starship
    htop
  ];
  
  users.users.root= {
    shell = pkgs.zsh;
  };

  programs.zsh = {
    enable = true;
    autosuggestions.enable = false;
    ohMyZsh.enable = true;
    ohMyZsh.plugins = [ "git" "fzf" "zoxide" ];
    syntaxHighlighting.enable = true;
    shellAliases = {
      ip = "ip --color=always"; # ip show colors 
      rclone = "rclone -P"; # always show rclone progress
      k = "kubectl";
      update = "$HOME/hetzner-nixos-install/update.sh";
      lg = "lazygit";
      k9s = "k9s --logoless";
    };

    promptInit = "source <(starship init zsh --print-full-init)";

    shellInit = ''
      eval "$(direnv hook zsh)"
      export EDITOR=hx
      export PATH=~/.npm-packages/bin:$PATH
      export NODE_PATH=~/.npm-packages/lib/node_modules
    '';
  };
  services.k3s.enable = true;
}