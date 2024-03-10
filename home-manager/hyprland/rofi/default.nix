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

  color1 = "#24242470";
  color2 = "#F7879A70";
  color3 = "#7E7E7E70";
  color4 = "#DEDEDE";
  color5 = "#FFFFFF";
  color6 = "#DEDEDE";
  color7 = "#FFFFFF70";
  color8 = "#ffb7c5";

  templatePath = ./spotlight-dark.rasi;
  templateContent = builtins.readFile templatePath;
  customizedContent = builtins.replaceStrings [ "{{color1}}" "{{color2}}" "{{color3}}" "{{color4}}" "{{color5}}" "{{color6}}" "{{color7}}" "{{color8}}" ]
    [ color1 color2 color3 color4 color5 color6 color7 color8 ]
    templateContent;
in
{

  home.file =
    {
      ".config/rofi/config.rasi".text = rofi;
      ".config/rofi/spotlight-dark.rasi".text = customizedContent;
    };
}
