{ config, pkgs, ... }: {

  # nixpkgs.config.allowAliases = false;

  nixpkgs.overlays = [
    (final: prev: {
      gnome = prev.gnome.overrideScope' (gnomeFinal: gnomePrev: {
        mutter = gnomePrev.mutter.overrideAttrs (old: {
          src = pkgs.fetchgit {
            url = "https://gitlab.gnome.org/vanvugt/mutter.git";
            # GNOME 45: triple-buffering-v4-45
            rev = "0b896518b2028d9c4d6ea44806d093fd33793689";
            sha256 = "sha256-mzNy5GPlB2qkI2KEAErJQzO//uo8yO0kPQUwvGDwR4w=";
          };
        });
      });
    })
  ];

  # programs.clash-verge.enable = true;

  environment.gnome.excludePackages = with pkgs.gnome; [
    gnome-shell-extensions
  ];


  # █▀▀ █▄░█ █▀█ █▀▄▀█ █▀▀
  # █▄█ █░▀█ █▄█ █░▀░█ ██▄
  # https://nixos.wiki/wiki/GNOME

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = false;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };


}
