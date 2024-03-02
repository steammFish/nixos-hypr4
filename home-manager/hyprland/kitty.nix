{ pkgs, config, username, fontFamily, fontSize, ... }:
let
  kitty =
    ''
      # vim:ft=kitty
      shell zsh
      window_padding_width    0.0
      confirm_os_window_close 0
      background_opacity      0.6
      font_size ${builtins.toString fontSize}
      font_family      ${fontFamily}
      bold_font        ${fontFamily}
      italic_font      ${fontFamily}
      bold_italic_font ${fontFamily}

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
