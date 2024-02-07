{ pkgs, config, ... }:
{
  home.packages = (with pkgs; [

    tlp
    chrome-gnome-shell
    dconf2nix
    ocs-url
    flatpak

    ## gnome themes 
    bibata-cursors
    whitesur-cursors
    whitesur-icon-theme
    papirus-icon-theme
    whitesur-gtk-theme
    mojave-gtk-theme
  ]);
}
