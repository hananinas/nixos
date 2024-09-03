{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    wget
    bat
    file
    unzip
    zip
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Meslo" ]; })
  ];

  programs = {
    neovim.enable = true;
    fish.enable = true;
    nix-ld.enable = true;
    nh = {
      enable = true;
      flake = "/home/hanan/NixOS";
    };
  };
}
