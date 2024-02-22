{ pkgs, config, ... }:

{
  imports = [
    ./nixvim.nix
    ./zsh.nix
    ./thunar.nix
  ];
}
