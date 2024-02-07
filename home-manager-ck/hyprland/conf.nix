{ pkgs, config, ... }:

let


  kitty = ''
    # vim:ft=kitty

    #zshell
    shell zsh

    # Remove close window confirm
    confirm_os_window_close 0

    # Font config
    font_family      MesloLGM Nerd Font 
    bold_font        MesloLGM Nerd Font 
    italic_font      MesloLGM Nerd Font 
    bold_italic_font MesloLGM Nerd Font 

    font_size 20

    # Window padding
    window_padding_width 0

    include ~/.cache/wal/colors-kitty.conf

  '';

  rofi-theme1 = ./spotlight-dark.rasi;

  rofi = ''
    configuration {               
    /*  modes: "window,run,ssh,drun";*/
    /*  font: "mono 12";*/
        font:   "Comic Mono 24";
    /*  location: 0;*/
    /*  yoffset: 0;*/
    /*  xoffset: 0;*/
    /*  fixed-num-lines: true;*/
    // ... cut ...
    /*  ml-row-down: "ScrollDown";*/                                                                                        
    /*  me-select-entry: "MousePrimary";*/                                                                                  
    /*  me-accept-entry: "MouseDPrimary";*/                                                                                 
    /*  me-accept-custom: "Control+MouseDPrimary";*/ 
    }

    @theme "/home/ck/.config/rofi/spotlight-dark.rasi"
    /* @import "~/.cache/wal/colors-rofi-dark.rasi" */
  '';

  dunst = {
    global = {
      origin = "top-right";
      width = "(0, 450)";
      offset = "30x30";
      font = "\"Fira Sans Semibold\" 18";
      transparency = 30;
      corner_radius = 10;
      #   height = "(0,300)";
      #   frame_color = "#ffffff";
      #   frame_width = 3;
      #   separator_height = 2;
      #   separator_color = "frame";
      #   notification_limit = 20;
      #   scale = 0;
      #   hide_duplicate_count = false;
      #   force_xwayland = false;
    };

    urgency_low = {

      background = "#00000070";
      foreground = "#888888";
      timeout = 6;
    };
    urgency_normal = {

      background = "#00000070";
      foreground = "#ffffff";
      timeout = 6;
    };
    urgency_critical = {

      background = "#90000070";
      foreground = "#ffffff";
      frame_color = "#ffffff";
      timeout = 6;
    };

  };

in

{

  home.file = {
    ".config/rofi/config.rasi".text = rofi;
    ".config/rofi/spotlight-dark.rasi".source = rofi-theme1;
    ".config/kitty/kitty.conf".text = kitty;
  };

  services.dunst.settings = dunst;

}
