{ pkgs, inputs, ... }: {
  imports = [
    ./fish.nix
    ./git.nix
    ./neovim.nix
    ./starship.nix
    ./kitty.nix
    ./wezterm.nix
    ./programs.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "hanan";
    homeDirectory = "/home/hanan";
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.05";
}
