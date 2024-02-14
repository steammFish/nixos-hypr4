{ pkgs, config, ... }:

{
  imports = [
    # ./nixvim.nix
    # ./fcitx5.nix
    ./zsh.nix
    ./thunar.nix
  ];
}
