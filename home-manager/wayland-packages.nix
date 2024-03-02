{ config, pkgs, ... }:

{

  home.packages = (with pkgs; [

    # 终端模拟器
    kitty
    foot
    alacritty
    starship

    # 外观和主题定制，系统工具
    ocs-url
    networkmanagerapplet
    brightnessctl
    pamixer
    playerctl
    waybar
    eww
    rofi-wayland
    wofi
    swaylock-effects
    pavucontrol
    xdg-user-dirs
    xdg-utils
    swayidle
    wlogout
    pywal
    swww
    cava
    hyprpicker
    hyprpaper
    # gsettings-qt
    gsettings-desktop-schemas
    neo-cowsay

    # pdf
    mupdf
    zathura

    # img 
    imagemagick # 命令行中编辑查看图像
    imv
    nomacs
    viewnior

    # 性能监视器和系统信息
    gotop
    htop
    pfetch
    neofetch
    aichat # Chat with gpt-3.5/chatgpt in terminal.

    # 系统权限
    polkit-kde-agent
    # polkit_gnome

    # 系统通知
    dunst
    libnotify
    mako

    # 剪贴板
    cliphist
    # clipman 
    # copyq

  ]) ++ (with pkgs; [
    # screenshot
    grim
    swappy
    slurp
    grimblast

  ]) ++ (with pkgs; [
    # google translate
    translate-shell
    rlwrap
    aspell
    espeak
    fribidi
  ]);


}
