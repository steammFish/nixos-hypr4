dir1="$HOME/wallpapers/"
dir2="$HOME/Pictures/wallpapers/"

WALLPAPER="$1"
  
function select_wallpaper {
  local dirs=("$dir1" "$dir2")
  local found_wallpapers=()
  local wallpapers

  for dir in "${dirs[@]}"; do
    if [[ -d "$dir" ]]; then
      # 使用循环读取 find 命令的输出
      while IFS= read -r wallpaper; do  # IFS= 防止 read 命令在空格处拆分行，而 -r 选项防止反斜杠字符被解释为转义字符。
        found_wallpapers+=("$wallpaper")
      done < <(find "$dir" -type f -o -type l 2>/dev/null | shuf)
    fi
  done

  if [[ ${#found_wallpapers[@]} -gt 0 ]]; then
    # 从累积的壁纸列表中随机选择一张
    WALLPAPER=${found_wallpapers[$RANDOM % ${#found_wallpapers[@]}]}
  else
    echo "No wallpapers found!"
    exit 1
  fi
}

function hypr_exec {
  # 终止正在运行的waybar和swww进程
  pkill waybar || true
  pkill swww || true

  # wal -i "$WALLPAPER"
  swww init && swww img "$WALLPAPER" --transition-type random
  waybar &
}

# 如果没有提供壁纸路径作为参数，就从指定文件夹随机选择一个
if [[ -z "$WALLPAPER" ]]; then
    select_wallpaper
fi

hypr_exec


