{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      set -x NIX_LD $(nix eval --impure --raw --expr 'let pkgs = import <nixpkgs> {}; NIX_LD = pkgs.lib.fileContents "${pkgs.stdenv.cc}/nix-support/dynamic-linker"; in NIX_LD')
    '';
    functions = {
      take = "mkdir -p \"$argv[1]\"; and cd \"$argv[1]\";";
    };
    shellAliases = {
      weather = "curl wttr.in/Choisy-le-Roi";
    };
    plugins = [
      { name = "git"; inherit (pkgs.fishPlugins.plugin-git) src; }
      { name = "sdkman"; inherit (pkgs.fishPlugins.sdkman-for-fish) src; }
    ];
  };
}
