{ pkgs, config, ... }:

{
  imports = [
    # ./nixvim.nix
    # ./neovim.nix
    ./zsh.nix
    ./thunar.nix
  ];
}
