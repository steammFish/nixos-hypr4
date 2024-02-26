{ config, pkgs, ... }:


{

  imports = [
    ./firefox
    ./helix
    ./vscode
    ./appimage
    ./youtube-download.nix
    ./yazi
    ./fcitx5.nix
    ./neovim.nix

  ];
}
