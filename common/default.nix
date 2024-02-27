{ pkgs, config, ... }:

{
  imports = [
    ./virtualization.nix
    # ./pkgs-gtk-themes
    ./networking.nix
    ./hardware.nix
    ./packages.nix
    ./programs
  ];
}
