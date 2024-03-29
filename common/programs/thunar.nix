{ pkgs, config, ... }:

{
  # ▀█▀ █░█ █░█ █▄░█ ▄▀█ █▀█
  # ░█░ █▀█ █▄█ █░▀█ █▀█ █▀▄

  # https://nixos.wiki/wiki/Thunar

  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images

  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  programs.file-roller.enable = true;


  programs.thunar = {
    plugins = (with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
      thunar-media-tags-plugin
      exo
      # ]) ++ (with pkgs.gnome; [
      #   file-roller
    ]);
  };

  environment.systemPackages = (with pkgs; [
    dolphin
    ark
    nautilus-open-any-terminal
  ]) ++ (with pkgs.gnome; [
    # file-roller 
    nautilus

  ]);

}
