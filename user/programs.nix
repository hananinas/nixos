{ pkgs, lib, ... }: {
  home.packages = with pkgs; [
    google-chrome
    vscode
    calibre
    obsidian
    go
    python3
    dotnetCorePackages.sdk_8_0_3xx
    jdk22
    git
    gh
    nodejs_22
    deno
    zsh
    oh-my-zsh
    libclang
    tmux
    ruby_3_3

  ];

  programs = {
    firefox.enable = true;
    zoxide.enable = true;
    direnv.enable = true;
    fzf.enable = true;
    atuin = {
      enable = true;
      settings = {
        style = "compact";
      };
    };
    zellij.enable = true;
    btop = {
      enable = true;
      settings = {
        color_theme = "gruvbox_dark";
      };
    };
    lsd = {
      enable = true;
      enableAliases = true;
    };
    yazi = {
      enable = true;
      enableFishIntegration = true;
    };
    mpv = {
      enable = true;
      config = {
        vo = "gpu";
        hwdec = "auto";
        volume = "75";
      };
      scripts = with pkgs.mpvScripts; [
        mpris
        sponsorblock
      ];
    };
  };

  services = {
    nextcloud-client = {
      enable = true;
      startInBackground = true;
    };
  };

  systemd.user.services.nextcloud-client = {
    Unit = {
      After = pkgs.lib.mkForce "graphical-session.target";
    };
  };
}
