{ pkgs
, config
, majorColor
, fontSize
  # , fontFamily
, ...
}:

# majorColor = "#F7879A";

let
  fontFamily = "FantasqueSansM Nerd Font";
in

let

  dunst = {
    global = {
      origin = "top-right";
      width = "(0, 450)";
      offset = "30x30";
      # font = "\"${fontFamily}\" ${builtins.toString fontSize}";
      font = "FantasqueSansM Nerd Font 20";
      transparency = 30;
      corner_radius = 6;
      frame_color = "#ffffff70";
      frame_width = 2;
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
      timeout = 6;
    };

  };

in

{
  services.dunst.settings = dunst;

}
