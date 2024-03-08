{ pkgs, config, fontSize, fontFamily, ... }:
let
in
{

  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    window = {
      dimensions = {
        lines = 3;
        columns = 200;
      };
      padding = {
        x = 15;
        y = 15;
      };
      opacity = 0.6;
    };
    font = {
      normal.family = fontFamily;
      size = fontSize;
      # normal.style = "Regular";
      # size = 18;
    };

    # key_bindings = [
    #   {
    #     key = "K";
    #     mods = "Control";
    #     chars = "\\x0c";
    #   }
    # ];


  };
}

