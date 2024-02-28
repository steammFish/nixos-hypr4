{ pkgs, config, lib, ... }:


{
  imports = [
    ./mypkgs
    ./programs
    ./hardware.nix
    ./networking.nix
    ./packages.nix
    ./virtualization.nix
  ];

}
