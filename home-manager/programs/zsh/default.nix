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
      
      ${builtins.readFile ./docker_deploy.sh}
      ${builtins.readFile ./yazi_cd.sh}
      ${builtins.readFile ./ck_trash.sh}
      ${builtins.readFile ./custom.sh}

    '';
    # oh-my-zsh = {
    #   enable = true;
    #   custom = "$HOME/my_customizations";
    # };
  };




}
