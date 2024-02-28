{ config, pkgs, lib, ... }:

let
  # 定义通用的包
  commonPackages = {
    inherit (pkgs) stdenv fetchFromGitHub fontforge unzip fetchgit makeWrapper;
    inherit lib;
  };

in
{
  environment.systemPackages = with commonPackages; [
    (import ./everforest-theme.nix { inherit stdenv fetchgit makeWrapper lib pkgs; })
    (import ./gruvbox-theme.nix { inherit stdenv fetchgit makeWrapper lib pkgs; })
    (import ./rose-pine-theme.nix { inherit stdenv fetchgit makeWrapper lib pkgs; })
  ];

  fonts.packages = with pkgs; [
    (import ./wps-fonts.nix { inherit stdenv fetchFromGitHub fontforge unzip lib; })
  ];

}
