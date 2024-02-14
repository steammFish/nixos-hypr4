{ config, pkgs, ... }:
let
  cursorSize = 32;
in
{
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = cursorSize;
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.whitesur-gtk-theme;
      name = "WhiteSur-Dark";
    };

    iconTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 14;
    };
  };


  home.packages = with pkgs; [

    whitesur-cursors
    whitesur-icon-theme
    # whitesur-gtk-theme
    # bibata-cursors
    papirus-icon-theme
    mojave-gtk-theme
    ant-theme
    ant-bloody-theme
    ant-nebula-theme
    flat-remix-gtk
    colloid-gtk-theme

  ];



}
