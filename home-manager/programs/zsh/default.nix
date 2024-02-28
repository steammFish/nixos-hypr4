{ config, pkgs, ... }:

{

  programs.zsh = {
    enable = true;
    historySubstringSearch.enable = true;
    zsh-abbr.enable = true;
    prezto.enable = true;
    initExtra = ''
      [[ ! -f ~/.bashrc ]] || source ~/.bashrc

      # Inline the content of websearch.zsh
      ${builtins.readFile ./websearch.zsh}

    '';
    # oh-my-zsh = {
    #   enable = true;
    #   custom = "$HOME/my_customizations";
    # };
  };




}
