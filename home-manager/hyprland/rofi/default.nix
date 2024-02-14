{ config, pkgs, ... }:
let

  rofi-theme1 = ./spotlight-dark.rasi;

  rofi =
    ''
      configuration {               
          font:   "Comic Mono 24";
      }
      @theme "/home/ck/.config/rofi/spotlight-dark.rasi"
      /* @import "~/.cache/wal/colors-rofi-dark.rasi" */
    '';

in
{
  home.file = {
    ".config/rofi/config.rasi".text = rofi;
    ".config/rofi/spotlight-dark.rasi".source = rofi-theme1;
  };

}
