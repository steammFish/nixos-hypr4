{ pkgs, config, ... }:

{


  # git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

  programs.neovim.enable = true;
  # programs.neovim = {
  #   viAlias = true;
  #   vimAlias = true;
  #   # configure.customRC = ''
  #   #   " here your custom configuration goes!
  #   # '';
  # };

}
