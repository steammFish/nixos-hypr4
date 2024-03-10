{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "你的名字";
    userEmail = "你的邮箱@example.com";
    extraConfig = {
      core = {
        editor = "hx"; # 设置默认编辑器为 Neovim
      };
      # pull = {
      #   rebase = "false"; # 设置 git pull 的默认行为
      # };
    };
  };
}
