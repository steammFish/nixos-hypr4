{ pkgs, config, ... }:

{
  imports = [
    ./zsh
    ./thunar.nix
    # ./nixvim.nix
  ];
}
