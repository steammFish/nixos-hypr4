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

  kitty = ''
    # vim:ft=kitty

    # window_padding_width 0.0
    shell zsh
    confirm_os_window_close 0
    background_opacity   0.8

    font_size 20
    font_family      MesloLGM Nerd Font 
    bold_font        MesloLGM Nerd Font 
    italic_font      MesloLGM Nerd Font 
    bold_italic_font MesloLGM Nerd Font 

    # include ~/.cache/wal/colors-kitty.conf

  '';

  dictURL = "https://github.com/felixonmars/fcitx5-pinyin-zhwiki/releases/download/0.2.4/zhwiki-20220416.dict";

in

{

  imports = [ ./wallpapers ];

  xdg.dataFile."fcitx5/pinyin/dictionaries/zhwiki-20220416.dict".source = pkgs.fetchurl {
    url = dictURL;
    sha256 = "vyvsychfpRMSQWgxQfCxD3QllmKBjDdcbIvJiEDfz+8=";
  };

  home.file = {
    ".filebrowser.json".text = filebrowser;
    ".config/swappy/config".text = swappy;
    ".config/kitty/kitty.conf".text = kitty;
  };


}
