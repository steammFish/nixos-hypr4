{ pkgs, config, username, ... }:
let
  kitty =
    ''
      # vim:ft=kitty
      shell zsh
      window_padding_width    0.0
      confirm_os_window_close 0
      background_opacity      0.8
      font_size 20
      font_family      MesloLGM Nerd Font 
      bold_font        MesloLGM Nerd Font 
      italic_font      MesloLGM Nerd Font 
      bold_italic_font MesloLGM Nerd Font 

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
