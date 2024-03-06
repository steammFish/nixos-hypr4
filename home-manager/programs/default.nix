{ config, pkgs, ... }:


{

  imports = [
    ./firefox
    ./helix
    ./vscode
    ./myapp
    ./youtube-download.nix
    ./yazi
    ./zsh
    ./fcitx5.nix
    ./alacritty.nix
    ./neovim.nix

  ];
}
