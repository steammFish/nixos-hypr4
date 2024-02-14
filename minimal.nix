{ config, pkgs, ... }:

{

  fileSystems."/home/ck/dr" = {
    device = "/dev/nvme0n1p6";
    fsType = "auto"; # 或者指定你的文件系统类型，比如 "ext4"、"ntfs"、"vfat" 等
    options = [ "rw" "nosuid" "nodev" ]; # 根据需要添加更多的挂载选项
  };

  # █▀▄▀█ █ █▄░█ █ █▀▄▀█ ▄▀█ █░░
  # █░▀░█ █ █░▀█ █ █░▀░█ █▀█ █▄▄

  # networking.firewall.enable = false;
  programs.hyprland.enable = true;
  # services.v2raya.enable = true;
  security.polkit.enable = true;

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
