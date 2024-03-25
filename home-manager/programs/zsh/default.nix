{ config, pkgs, ... }:

{

  programs.zsh = {
    enable = true;
    historySubstringSearch.enable = true;
    zsh-abbr.enable = true;
    prezto.enable = true;
    initExtra = ''
      [[ ! -f ~/.bashrc ]] || source ~/.bashrc

      # 增加历史记录大小
      HISTSIZE=10000
      SAVEHIST=10000

      # 历史记录选项
      setopt HIST_IGNORE_ALL_DUPS # 忽略所有重复的命令
      setopt HIST_IGNORE_DUPS    # 忽略连续的重复命令
      setopt HIST_IGNORE_SPACE   # 忽略以空格开始的命令
      setopt HIST_FIND_NO_DUPS   # 在使用历史搜索时忽略重复
      setopt EXTENDED_HISTORY    # 保存命令执行的时间戳
      setopt HIST_EXPIRE_DUPS_FIRST # 删除重复命令中的旧命令

      # Inline the content of websearch.zsh
      ${builtins.readFile ./websearch.zsh}
      
      ${builtins.readFile ./docker_deploy.sh}
      ${builtins.readFile ./yazi_cd.sh}
      ${builtins.readFile ./ck_trash.sh}
      ${builtins.readFile ./fzf_ext.sh}
      ${builtins.readFile ./custom.sh}
      ${builtins.readFile ./create_c_and_h_files.sh}

    '';
    # oh-my-zsh = {
    #   enable = true;
    #   custom = "$HOME/my_customizations";
    # };
  };




}
