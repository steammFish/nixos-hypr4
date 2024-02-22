{ pkgs, config, username, ... }:

let


  filebrowser =
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

  swappy =
    ''
      [Default]
      save_dir=$HOME/Pictures/screenshots
      save_filename_format=swappy-%Y%m%d-%H%M%S.png
      show_pannel=false
      line_size=5
      text_size=18
      text_font=JetBrainsMono Nerd Font
      paint_mode=brush
      early_exit=false
      fill_shape=false
    '';

  dictURL = "https://github.com/felixonmars/fcitx5-pinyin-zhwiki/releases/download/0.2.4/zhwiki-20220416.dict";

in

{

  # imports = [ ./wallpapers ];

  xdg.dataFile."fcitx5/pinyin/dictionaries/zhwiki-20220416.dict".source = pkgs.fetchurl {
    url = dictURL;
    sha256 = "vyvsychfpRMSQWgxQfCxD3QllmKBjDdcbIvJiEDfz+8=";
  };


  home.file = {
    "wallpapers".source = ./wallpapers;
    ".filebrowser.json".text = filebrowser;
    ".config/swappy/config".text = swappy;
  };


}
