{ pkgs, inputs, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      wl-clipboard
      unzip
      python3
      nodejs
      gcc
      gnumake
      cargo
      deadnix
      statix
    ];
  };

  xdg.configFile.nvim = {
    source = ./nvchad_custom;
    recursive = true;
  };
}
