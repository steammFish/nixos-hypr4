{ pkgs, config, ... }:

let

  dunst = {
    global = {
      origin = "top-right";
      width = "(0, 450)";
      offset = "30x30";
      font = "\"Fira Sans Semibold\" 18";
      transparency = 30;
      corner_radius = 10;
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
  services.dunst.settings = dunst;

}
