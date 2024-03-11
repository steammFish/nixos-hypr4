{ config, pkgs, username, ... }:
let
  cursorSize = 32;

  preferDark = {
    gtk-application-prefer-dark-theme = 1;
  };

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

    gtk3.extraConfig = preferDark;
    gtk4.extraConfig = preferDark;

    # theme = {
    #   package = pkgs.whitesur-gtk-theme;
    #   name = "WhiteSur-Dark";
    # };

    theme = {
      package = pkgs.gnome.gnome-themes-extra;
      name = "Adwaita-dark";
    };

    iconTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita";
    };

    # font = {
    #   name = "DejaVu Sans";
    #   size = 13;
    # };

    font = {
      # name = "Iosevka Nerd Font";
      name = "RobotoMono Nerd Font";
      size = 14;
    };

  };



  # 配置 GTK 3 书签
  xdg.userDirs.enable = true;
  gtk.gtk3.bookmarks = [
    "file:///home/${username}/Documents"
    "file:///home/${username}/Downloads"
    "file:///home/${username}/Pictures"
    "file:///home/${username}/Videos"
    "file:///home/${username}/Music"
  ];




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
