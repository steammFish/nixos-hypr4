{ config, pkgs, lib, ... }:
let

  pkgsBasic = with pkgs;  [

    ## dev 
    gcc
    clang
    glibc
    gnumake
    cmake
    ffmpeg-full
    openssl
    asio
    (python311.withPackages (ps: with ps; [ pandas requests ]))

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
    youtube-music
    gnome.gnome-calendar
    gnome.gnome-software
    flatpak
    home-manager


  ];

  fontsExtra = with pkgs; [

    ubuntu_font_family
    dejavu_fonts
    monaspace
    montserrat
    comic-mono
    comic-relief
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
      allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [ "ngrok" ];
      permittedInsecurePackages = [ "electron-25.9.0" ];
    };
  };
  # environment.systemPackages = with pkgs; [];
  environment.systemPackages = lib.mkMerge [ pkgsBasic pkgsDesktop ];

  # █▀▀ █▀█ █▄░█ ▀█▀ █▀
  # █▀░ █▄█ █░▀█ ░█░ ▄█
  fonts.packages = lib.mkMerge [ fontsExtra ];

  # 确保字体配置生效
  fonts.fontconfig.defaultFonts = {
    sansSerif = [ "Noto Sans CJK SC" "Iosevka Nerd Font" ];
    serif = [ "Noto Serif CJK SC" "JetBrainsMono Nerd Font" ];
    monospace = [ "Noto Sans Mono CJK SC" ];
  };

  # █▀▀ █░░ ▄▀█ ▀█▀ █▀█ ▄▀█ █▄▀
  # █▀░ █▄▄ █▀█ ░█░ █▀▀ █▀█ █░█
  # https://nixos.wiki/wiki/Fonts
  services.flatpak.enable = true;
  fonts.fontDir.enable = true; # FIXME: flatpak app 'qq music' font error


}
