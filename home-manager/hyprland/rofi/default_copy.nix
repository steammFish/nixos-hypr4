{ config, pkgs, ... }:
let

  rofi =
    ''
      @theme "/home/ck/.config/rofi/spotlight-dark.rasi"
      /* configuration {               
          font:   "Comic Mono 24";
      } 
      @import "~/.cache/wal/colors-rofi-dark.rasi"  */
    '';

  mycolors = {
    bg = {
      color1 = "#24242499";
      color2 = "#F7879A99";
      color3 = "#7E7E7E99";
    };

    fg = {
      color4 = "#DEDEDE";
      color5 = "#FFFFFF";
      color6 = "#DEDEDE";
    };

    other = {
      color7 = "#FFFFFF99"; # border 
      color8 = "#ffb7c5"; # textbox
    };
  };

  templatePath = ./spotlight-dark.rasi;
  templateContent = builtins.readFile templatePath;
  customizedContent = builtins.replaceStrings [ "{{color1}}" "{{color2}}" "{{color3}}" "{{color4}}" "{{color5}}" "{{color6}}" "{{color7}}" "{{color8}}" ]
    [
      mycolors.bg.color1
      mycolors.bg.color2
      mycolors.bg.color3
      mycolors.fg.color4
      mycolors.fg.color5
      mycolors.fg.color6
      mycolors.other.color7
      mycolors.other.color8
    ]
    templateContent;
in
{

  home.file =
    {
      ".config/rofi/config.rasi".text = rofi;
      ".config/rofi/spotlight-dark.rasi".text = customizedContent;
    };
}
