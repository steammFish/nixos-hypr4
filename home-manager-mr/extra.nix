# theme andromeda

{ lib, pkgs, ... }:
{

  imports = [
    ../home-manager-ck/helix
    ../home-manager-ck/vscode
  ];

  home.packages = (with pkgs; [

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

    bibata-cursors
    papirus-icon-theme

    google-chrome
    ocs-url
    telegram-desktop

    htop
    helix
    git
    wget
    unzip
    unrar
    ripgrep
    bat
    fzf
    eza
    tldr
    dnsutils

  ]);

  home.sessionVariables = {
    EDITOR = "hx";
    NIX_CONFIG_BY_MR = "$HOME/.config/home-manager";
  };

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "google-chrome-121.0.6167.85" ];
    permittedInsecurePackages = [ "electron-25.9.0" ];
  };

}



