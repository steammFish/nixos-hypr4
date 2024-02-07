{ config, pkgs, ... }: {
  imports = [
    ./dconf
    ./packages.nix
  ];
}
