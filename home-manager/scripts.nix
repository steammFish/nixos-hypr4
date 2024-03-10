{ config, pkgs, ... }:
let

  hypr_start = pkgs.writeShellScriptBin "hypr_start"
    ''
      dir1="$HOME/wallpapers/"
      dir2="$HOME/Pictures/wallpapers/"

      WALLPAPER="$1"
        
      function select_wallpaper1 {
        # 初始化一个空数组来存储存在的目录
        existing_dirs=()

        # 检查每个目录是否存在，如果存在，则添加到数组中
        [[ -d "$dir1" ]] && existing_dirs+=("$dir1")
        [[ -d "$dir2" ]] && existing_dirs+=("$dir2")

        # 如果至少有一个目录存在
        if [ ''${#existing_dirs[@]} -gt 0 ]; then
          # 使用存在的目录作为 find 命令的参数
          wallpapers_list=$(find "''${existing_dirs[@]}" -type f -o -type l 2>/dev/null)
          # 从找到的壁纸列表中随机选择一张壁纸
          WALLPAPER=$(echo "$wallpapers_list" | shuf -n 1)
          # 检查是否找到了壁纸
          if [ -z "$WALLPAPER" ]; then
              echo "No wallpapers found!"
              exit 1
          fi
        else
          echo "No directories found."
          exit 1
        fi
      }

      function select_wallpaper2 {
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
                echo "No wallpapers found!"
                exit 1
            fi
        fi
      }

      function hypr_exec() {
        # 终止正在运行的waybar和swww进程
        pkill waybar || true
        pkill swww || true

        # wal -i "$WALLPAPER"
        swww init && swww img "$WALLPAPER" --transition-type random
        waybar &
      }

      # 如果没有提供壁纸路径作为参数，就从指定文件夹随机选择一个
      if [[ -z "$WALLPAPER" ]]; then
         select_wallpaper1
      fi

      hypr_exec
    '';

  rofi_google_trans = pkgs.writeShellScriptBin "rofi_google_trans"
    ''
      query=$( (echo -n) | rofi -dmenu -p "Search:" -mesg "Google 翻译")
       # -filter "bilibili")
      # query=$( (echo -n) | rofi -dmenu -p "Search:" -mesg "Google 翻译" | tr -s ' ')
      if [ -n "$query" ]; then
          google-chrome-stable "https://translate.google.com/?text=$query"
          # google-chrome --new-window 
      fi
    '';


  find_file_and_open_with_vscode = pkgs.writeShellScriptBin "find_file_and_open_with_vscode"
    ''
      if [ $# -ne 1 ]; then
          echo "Usage: $0 <keyword>"
          echo "  <keyword>: 文件名关键字"
          exit 1
      fi

      # 创建临时项目文件夹
      temp_project_dir=$(mktemp -d) || { echo "Error: 无法创建临时项目文件夹"; exit 1; }
      echo "创建临时项目文件夹: $temp_project_dir"

      # 复制文件到临时项目文件夹中
      keyword="$1"
      find . -type f -name "*$keyword*" -exec cp -r {} "$temp_project_dir" \;

      # 使用VSCode打开项目
      code "$temp_project_dir"
    '';


  rofi_search = pkgs.writeShellScriptBin "rofi_search"
    ''
      history_file="$HOME/.rofi_history"
      source="$1"

      # Default source is "google" if not provided
      if [ -z "$source" ]; then
          source="google"
      fi

      # Create history file if it doesn't exist
      if [ ! -f "$history_file" ]; then
          touch "$history_file"
      fi

      query=$( (echo -n) | rofi -dmenu -p "Search:" -mesg "search on $source" < "$history_file" | sed -E "s/^[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2} $source //")

      if [ -n "$query" ]; then
          echo "$(date +"%Y-%m-%d %T") $source $query" >> "$history_file"
    
          # Determine search URL based on source
          case "$source" in
              "google")
                  search_url="https://www.google.com/search?q=$query"
                  ;;
              "cppreference")
                  search_url="https://duckduckgo.com/?sites=cppreference.com&q=$query"
                  ;;
              "mynixos")
                  search_url="https://mynixos.com/search?q=$query"
                  ;;
              *)
                  echo "Unknown source: $source"
                  exit 1
                  ;;
          esac

          google-chrome-stable "$search_url"
      fi


    '';

in

{
  home.packages = [
    hypr_start
    rofi_google_trans
    rofi_search
    find_file_and_open_with_vscode
  ];
}

