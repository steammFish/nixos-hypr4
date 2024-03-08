{ config, pkgs, lib, ... }:
let



  pkgsDev = with pkgs;  [

    ## dev 
    gcc
    gdb
    cmake
    gnumake
    ninja
    # clang
    # glibc
    ffmpeg-full
    openssl
    asio
    (python311.withPackages (ps: with ps; [ pandas requests ]))

    # vulkan-loader
    # qt6.full
    # qt6.qtwayland
    # qtcreator

  ];
  pkgsDesktop = with pkgs;  [

    vscode
    firefox
    floorp
    vlc
    obsidian
    keepassxc
    gparted
    google-chrome
    spotify
    telegram-desktop
    discord
    gnome.gnome-calendar
    gnome.gnome-software
    flatpak
    home-manager
    wpsoffice
    # youtube-music
    # mpd


  ];

  fontsExtra = with pkgs; [

    # comic-mono
    # comic-relief
    ubuntu_font_family
    dejavu_fonts
    monaspace
    montserrat
    liberation_ttf
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts

    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    wqy_zenhei
    wqy_microhei
    arphic-ukai
    arphic-uming

    google-fonts

    font-awesome
    line-awesome

    material-icons
    material-symbols
    material-design-icons

    (nerdfonts.override {
      fonts = [
        "SpaceMono"
        "JetBrainsMono"

        "FiraCode"
        "FiraMono"

        "RobotoMono"
        "FantasqueSansMono"
        "DroidSansMono"
        "Meslo"
        "Hack"
        "Iosevka"
        "Cousine"
      ];
    })
  ];

in
{

  # █▀█ ▄▀█ █▀▀ █▄▀ ▄▀█ █▀▀ █▀▀ █▀
  # █▀▀ █▀█ █▄▄ █░█ █▀█ █▄█ ██▄ ▄█
  nixpkgs = {
    config = {
      allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
        "ngrok"
        "wpsoffice"
      ];
      permittedInsecurePackages = [ "electron-25.9.0" "freeimage-unstable-2021-11-01" ];
    };
  };



  # environment.systemPackages = with pkgs; [];
  environment.systemPackages = lib.mkMerge [ pkgsDev pkgsDesktop ];

  # █▀▀ █▀█ █▄░█ ▀█▀ █▀
  # █▀░ █▄█ █░▀█ ░█░ ▄█
  fonts = {
    packages = lib.mkMerge [ fontsExtra ];
    enableDefaultPackages = true;

    # 确保字体配置生效
    fontconfig.defaultFonts = {
      sansSerif = [ "Noto Sans CJK SC" "Iosevka Nerd Font" ];
      serif = [ "Noto Serif CJK SC" "JetBrainsMono Nerd Font" ];
      monospace = [ "Noto Sans Mono CJK SC" ];
    };
  };

  # █▀▀ █░░ ▄▀█ ▀█▀ █▀█ ▄▀█ █▄▀
  # █▀░ █▄▄ █▀█ ░█░ █▀▀ █▀█ █░█
  # https://nixos.wiki/wiki/Fonts
  services.flatpak.enable = true;
  fonts.fontDir.enable = true; # FIXME: flatpak app 'qq music' font error


}
