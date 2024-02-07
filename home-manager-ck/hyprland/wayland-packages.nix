{ config, pkgs, ... }:

{

  home.packages = with pkgs; [

    # 浏览器
    firefox

    # 终端模拟器
    kitty
    foot
    alacritty

    # 系统工具
    networkmanagerapplet
    brightnessctl
    pamixer
    starship
    waybar
    eww-wayland
    rofi-wayland
    wofi
    dunst
    mako
    swaylock-effects
    libnotify
    playerctl
    pavucontrol
    xdg-user-dirs
    xdg-utils
    gsettings-desktop-schemas
    swayidle
    wlogout
    imagemagick

    # 文件查看器和管理器
    imv
    zathura
    nomacs
    nomacs

    # 性能监视器和系统信息
    gotop
    pfetch
    neofetch

    # 外观和主题定制
    pywal
    cava
    cliphist
    # clipman 
    # copyq
    blueman
    hyprpicker
    hyprpaper
    polkit-kde-agent
    polkit_gnome

    # 版本控制和开发工具
    nix-prefetch-git

    # 其他
    swww

    # screenshot
    grim
    swappy
    slurp

  ];


}
