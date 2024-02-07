{ config, pkgs, ... }:
let


  hypr_start = pkgs.writeShellScriptBin "hypr_start"
    ''
      image_dir="$HOME/Pictures/wallpapers"
      WALLPAPER=$1

      # 如果没有提供壁纸路径作为参数，就从指定文件夹随机选择一个
      if [[ -z "$WALLPAPER" ]]; then
        WALLPAPER=$(find "$image_dir" -type f | shuf -n 1)
      fi

      # 终止正在运行的waybar和swww进程
      pkill waybar || true
      pkill swww || true

      # 设置壁纸
      wal -i "$WALLPAPER"
      swww init && swww img "$WALLPAPER"

      # 启动waybar
      waybar&

    '';

in

{

  home.packages = [ hypr_start ];

}
