{ config, pkgs, ... }:
let

  hypr_start =
    pkgs.writeShellScriptBin "hypr_start"
      ''
        dir1="$HOME/wallpapers/"
        dir2="$HOME/Pictures/wallpapers/"

        WALLPAPER="$1"

        # 如果没有提供壁纸路径作为参数，就从指定文件夹随机选择一个
        if [[ -z "$WALLPAPER" ]]; then

          pic1=$(find "$dir1" -type f -o -type l | shuf -n 1)
          pic2=$(find "$dir2" -type f -o -type l | shuf -n 1)

          # 再次从 pic1 和 pic2 中随机选择一张图片
          WALLPAPER=$(echo -e "$pic1\n$pic2" | shuf -n 1)

          # 如果 pic1 或 pic2 为空，则将另一个非空的值赋给 WALLPAPER
          if [ -z "$WALLPAPER" ]; then
              if [ -n "$pic1" ]; then
                  WALLPAPER="$pic1"
              elif [ -n "$pic2" ]; then
                  WALLPAPER="$pic2"
              else
                  echo "no such picture!"
              fi
          fi

        fi

        # 检查是否成功找到壁纸
        if [[ ! -f "$WALLPAPER" ]]; then
          echo "壁纸文件没有找到: $WALLPAPER"
          exit 1
        fi

        # 终止正在运行的waybar和swww进程
        pkill waybar || true
        pkill swww || true

        # 设置壁纸
        # wal -i "$WALLPAPER"
        swww init && swww img "$WALLPAPER" --transition-type random

        # 启动waybar
        waybar &

      '';

  # yazicd =
  #   pkgs.writeShellScriptBin "yazicd"
  #     ''
  #       if [ $# -eq 1 ]; then
  #         if [ -d "$1" ]; then
  #           cd -- "$1" || return 1
  #         else
  #           echo "路径不存在或不是一个目录"
  #           return 1
  #         fi
  #       fi

  #       tmp="$(mktemp -t "yazi-cwd.XXXXX")"
  #       yazi --cwd-file="$tmp"
  #       if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
  #         cd -- "$cwd"
  #       fi
  #       rm -f -- "$tmp"

  #     '';

in

{
  home.packages = [ hypr_start ];
}

