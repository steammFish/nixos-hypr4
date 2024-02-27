{ config, pkgs, ... }:
let
  zshInit = ''
    export MY_NIX_CONFIG_DIR="/home/ck/dotfiles/myhome/nixos"
    alias epr="export all_proxy=http://192.168.43.1:10809/ && curl www.google.com"
    alias upd="sudo nixos-rebuild switch --flake $MY_NIX_CONFIG_DIR"
  '';
in

{

  # █▀▄▀█ █ █▄░█ █ █▀▄▀█ ▄▀█ █░░
  # █░▀░█ █ █░▀█ █ █░▀░█ █▀█ █▄▄
  # networking.hostName = "ck-nixos"; # Define your hostname.

  # programs.zsh.enable = true;
  # programs.zsh.shellInit = zshInit;
  # networking.firewall.enable = false;
  # networking.proxy.default = "http://192.168.43.1:10809/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  security.polkit.enable = true;
  services.v2raya.enable = true;
  programs.hyprland.enable = true;

  fileSystems."/home/ck/dotfiles" = {
    device = "/dev/nvme0n1p6";
    fsType = "auto"; # 或者指定你的文件系统类型，比如 "ext4"、"ntfs"、"vfat" 等
    options = [ "rw" "nosuid" "nodev" ]; # 根据需要添加更多的挂载选项
  };

  # services.xserver = {
  #   xkb = {
  #     layout = "us";
  #     options = "caps:escape";
  #     variant = "";
  #   };
  # };

  environment.systemPackages = with pkgs; [

    kitty
    waybar
    firefox

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
    ntfs3g

    dconf2nix
    nmap
    wl-clipboard
    man-pages
    filebrowser
    nix-prefetch-git
    appimage-run

  ];


  environment.variables = {
    EDITOR = "hx";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;



}
