{ pkgs, config, ... }:

let
  yazi = ./yazi_preset;

  yt-dlp =
    ''
      --ignore-errors
      -o ~/Videos/%(title)s.%(ext)s
      # Prefer 1080p or lower resolutions
      -f bestvideo[ext=mp4][width<=2000][height<=1200]+bestaudio[ext=m4a]/bestvideo[ext=webm][width<=2000][height<=1200]+bestaudio[ext=webm]/bestvideo[width<=2000][height<=1200]+bestaudio/best[width<=2000][height<=1200]/best
    '';

  swappy =
    ''
      [Default]
      save_dir=$HOME/Desktop
      save_filename_format=swappy-%Y%m%d-%H%M%S.png
      show_pannel=false
      line_size=5
      text_size=18
      text_font=JetBrainsMono Nerd Font
      paint_mode=brush
      early_exit=false
      fill_shape=false
    '';


  filebrowser =
    let
      username = "ck";
    in
    ''
      {
        "address": "0.0.0.0",
        "database": "/home/${username}/.filebrowser/filebrowser.db",
        "log": "/home/${username}/.filebrowser/filebrowser.log",
        "port": 8888,
        "root": "/home/${username}",
        "username": "admin"
      }

    '';


  dictURL = "https://github.com/felixonmars/fcitx5-pinyin-zhwiki/releases/download/0.2.4/zhwiki-20220416.dict";



in


{
  home.file = {
    ".filebrowser.json".text = filebrowser;
    ".config/swappy/config".text = swappy;
    ".config/yazi".source = yazi;
    # ".config/yt-dlp/config".text = yt-dlp;

  };

  xdg.dataFile."fcitx5/pinyin/dictionaries/zhwiki-20220416.dict".source = pkgs.fetchurl {
    url = dictURL;
    sha256 = "vyvsychfpRMSQWgxQfCxD3QllmKBjDdcbIvJiEDfz+8=";
  };

}
