{ config, pkgs, userVar, ... }:


let
  settings = import ./settings.nix;
  styles = import ./styles.nix;

in
{
  # imports = [ ./cava-internal.nix ];

  programs.waybar.enable = true;
  programs.waybar.settings = settings.settings;
  programs.waybar.style = styles.styles;



}
