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
    ./alacritty.nix
    ./fcitx5.nix
    ./neovim.nix

  ];
}
