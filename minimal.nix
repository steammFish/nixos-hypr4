{ config, pkgs, ... }:

{

  # users.users.ck = {
  #   extraGroups = [ "networkmanager" "wheel" ];
  #   packages = with pkgs; [
  #   ];
  # };








  fileSystems."/home/ck/dr" = {
    device = "/dev/nvme0n1p6";
    fsType = "auto"; # 或者指定你的文件系统类型，比如 "ext4"、"ntfs"、"vfat" 等
    options = [ "rw" "nosuid" "nodev" ]; # 根据需要添加更多的挂载选项
  };

  # users.users.ck = {
  #   isNormalUser = true;
  #   home = "/home/ck";
  #   # 确保用户 'ck' 的 UID 和 GID 能够访问 '/home/ck/Documents'
  #   # 你可能需要设置 'uid' 和 'gid'，如果它们已经在其他地方定义了，就不需要了
  #   # uid = 1000;
  #   # group = "users";
  #   extraGroups = [ "wheel" ];  # 如果你想让 'ck' 用户有 sudo 权限
  #   # ... 其他用户配置 ...
  # };







  # █▀▄▀█ █ █▄░█ █ █▀▄▀█ ▄▀█ █░░
  # █░▀░█ █ █░▀█ █ █░▀░█ █▀█ █▄▄

  # networking.firewall.enable = false;
  programs.hyprland.enable = true;
  services.v2raya.enable = true;
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

  ];


  environment.variables = {
    EDITOR = "hx";
  };


  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;



}
