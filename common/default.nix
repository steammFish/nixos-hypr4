{ pkgs, config, ... }:

{
  imports = [
    ./docker
    ./pkgs-gtk-themes
    ./fcitx5.nix
    ./networking.nix
    ./nixvim.nix
    ./packages.nix
    ./power.nix
    ./zsh.nix
    ./virtualbox.nix
    ./pipewire.nix
    ./bluetooth.nix
    ./thunar.nix
    ./yazi.nix
  ];
}
