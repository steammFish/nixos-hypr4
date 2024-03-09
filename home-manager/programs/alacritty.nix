{ pkgs, config, fontSize, fontFamily, ... }:
let
  theme =
    ''
      # Colors (Baitong)

      [colors.primary]
      background = '#112a2a'
      foreground = '#33ff33'

      [colors.cursor]
      text = '#112a2a'
      cursor = '#ff00ff'

      [colors.vi_mode_cursor]
      text = '#112a2a'
      cursor = '#ff00ff'

      [colors.search]
      matches = { foreground = '#000000', background = '#1AE642' }
      focused_match = { foreground = '#000000', background = '#ff00ff' }

      [colors.hints]
      start = { foreground = '#1d1f21', background = '#1AE642' }
      end = { foreground = '#1AE642', background = '#1d1f21' }

      [colors.line_indicator]
      foreground = '#33ff33'
      background = '#1d1f21'

      [colors.footer_bar]
      background = '#731d8b'
      foreground = '#ffffff'

      [colors.selection]
      text = '#112a2a'
      background = '#1AE642'

      # Normal colors
      [colors.normal]
      black   = '#000000'
      red     = '#f77272'
      green   = '#33ff33'
      yellow  = '#1AE642'
      blue    = '#68FDFE'
      magenta = '#ff66ff'
      cyan    = '#87CEFA'
      white   = '#dbdbd9'

      # Bright colors
      [colors.bright]
      black   = '#ffffff'
      red     = '#f77272'
      green   = '#33ff33'
      yellow  = '#1AE642'
      blue    = '#68FDFE'
      magenta = '#ff66ff'
      cyan    = '#68FDFE'
      white   = '#dbdbd9'

    '';
in
{
  xdg.configFile."alacritty/theme.toml".text = theme;


  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    import = [
      "~/.config/alacritty/theme.toml"
    ];
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

