{ pkgs, config, username, serif, fontSize, ... }:
let
  kitty =
    ''
      # vim:ft=kitty
      shell zsh
      window_padding_width    0.0
      confirm_os_window_close 0
      background_opacity      0.6
      font_size ${builtins.toString fontSize}
      font_family      ${serif}
      bold_font        ${serif}
      italic_font      ${serif}
      bold_italic_font ${serif}

      # BEGIN_KITTY_THEME
      # Crayon Pony Fish
      include current-theme.conf
      # END_KITTY_THEME
    '';
in
{
  home.file = {
    ".config/kitty/kitty.conf".text = kitty;
  };

}
