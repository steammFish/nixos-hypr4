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
in
{
  home.file = {
    "wallpapers".source = ./wallpapers;
    ".filebrowser.json".text = filebrowser;
    # ".config/swappy/config".text = swappy;
  };

  xdg.configFile = {
    "swappy/config".text = swappy;
  };

}
