{ config, pkgs, ... }:


{

  imports = [
    ./firefox
    ./helix
    ./vscode
    ./qq
    ./youtube-download.nix
    ./yazi
    ./fcitx5.nix

  ];
}
