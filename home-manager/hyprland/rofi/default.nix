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

  mycolors =
    let

      background = "#1E1E2E"; # base
      foreground = "#CDD6F4"; # text
      black = "#45475A"; # surface1
      red = "#F38BA8"; # red
      green = "#A6E3A1"; # green
      yellow = "#F9E2AF"; # yellow
      blue = "#89B4FA"; # blue
      magenta = "#F5C2E7"; # pink
      cyan = "#94E2D5"; # teal
      white = "#BAC2DE"; # subtext1

      opacity = "99";

    in
    {
      bg = {
        color1 = "${background}${opacity}";
        color2 = "${red}"; # red
        color3 = "${background}${opacity}";
      };

      fg = {
        color4 = "${foreground}";
        color5 = "${foreground}";
        color6 = "${foreground}";
      };
      other = {
        color7 = "${foreground}${opacity}"; # border
        color8 = "${red}"; # textbox
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
