{ pkgs, config, ... }:
{
  home.packages = (with pkgs; [

    # ...

  ]) ++ (with pkgs.gnome; [

    dconf-editor
    # gnome-terminal
    gnome-tweaks
    gnome-software

  ]) ++ (with pkgs.gnomeExtensions; [

    appindicator # support for app indicator
    clipboard-indicator
    kimpanel # fcitx5 skiing
    disk-usage
    internet-speed-meter
    user-themes
    places-status-indicator

    tiling-assistant
    blur-my-shell
    burn-my-windows
    dash-to-panel
    just-perfection

    # dash-to-dock
    # fly-pie

  ]);

  # TODO: gnome-shell themes
  # Graphite multicolor mode
  # https://www.gnome-look.org/p/2014493

  # Marble Shell theme
  # https://www.gnome-look.org/p/1977647/

}
