{
  imports =
    [
      ./hardware-configuration.nix
      ./boot.nix
      ./network.nix
      ./graphical.nix
      ./locale.nix
      ./sound.nix
      ./users.nix
      ./programs.nix
      ./nix.nix
      ./locate.nix
      ./vm.nix
      ./udev.nix
    ];


  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.05";
}
