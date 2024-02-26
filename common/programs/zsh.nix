{ config, pkgs, ... }:

let

  yaziInit = ''
    yazicd() {
      if [ $# -eq 1 ]; then
        if [ -d "$1" ]; then
          cd -- "$1" || return 1
        else
          echo "路径不存在或不是一个目录"
          return 1
        fi
      fi

      tmp="$(mktemp -t "yazi-cwd.XXXXX")"
      yazi --cwd-file="$tmp"
      if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd -- "$cwd"
      fi
      rm -f -- "$tmp"

    }

  '';

in
{

  programs.zsh.shellInit = yaziInit;
  programs.bash.interactiveShellInit = yaziInit;

  # environment.systemPackages = with pkgs; [
  #   pokemonsay
  #   fortune
  #   pokemon-colorscripts-mac
  # ];

  # █▄▄ ▄▀█ █▀ █░█
  # █▄█ █▀█ ▄█ █▀█

  # programs.bash.enableCompletion = true;
  # programs.bash.interactiveShellInit = "";


  # ▀█ █▀ █░█
  # █▄ ▄█ █▀█

  users.defaultUserShell = pkgs.zsh;

  programs.zsh.enable = true;
  programs.zsh = {

    # histFile
    # histSize
    # setOptions
    # vteIntegration

    shellAliases = {
      home = "cd ~/.config/home-manager";
      sys = "cd /etc/nixos";
    };

    # interactiveShellInit = ''
    #   # ${pkgs.pokemon-colorscripts-mac}/bin/pokemon-colorscripts -r
    # '';

    promptInit = ''
      # source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      ${pkgs.pfetch}/bin/pfetch
    '';

    zsh-autoenv.enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    enableLsColors = true;
    enableCompletion = true;
    enableGlobalCompInit = true;
    enableBashCompletion = true;

    ohMyZsh = {
      enable = true;
      theme = "fishy";
      plugins = [ "git" "z" "extract" "dirhistory" "colored-man-pages" ];
    };

  };
}


# programs.zsh.shellInit = "";
# 在 zsh shell 初始化过程中调用的 Shell 脚本代码

# programs.zsh.promptInit = "";
# 用于初始化 zsh 提示符的 Shell 脚本代码

# programs.zsh.loginShellInit = "";
# 在 zsh 登录 shell 初始化过程中调用的 Shell 脚本代码

# programs.zsh.enableGlobalCompInit = "";
# 为所有交互式 zsh shell 启用 compinit 调用的执行

# programs.zsh.interactiveShellInit = "";
# 在交互式 zsh shell 初始化过程中调用的 Shell 脚本代码
