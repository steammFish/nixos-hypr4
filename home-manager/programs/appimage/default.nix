{ pkgs, config, ... }:

{
  home.file = {
    ".mybin/qq".source = ./qq;
  };

  # xdg.dataFile = {
  #   "applications/linuxqq.desktop".source = ./qq/linuxqq.desktop;
  # };

  xdg.desktopEntries = {
    linux_qq = {
      name = "Linux QQ";
      exec = "/home/ck/.mybin/qq/launch_linuxqq.sh";
      icon = "/home/ck/.mybin/qq/tencent-qq.png";
      type = "Application";
      categories = [ "Network" ];
    };
  };


  # xdg.enable = true;
  # xdg.stateHome = "~/.local/state";
  # xdg.cacheHome = "~/.cache";
  # xdg.configHome = "~/.config";
  # xdg.dataHome = "~/.local/share";

  # xdg.desktopEntries = {
  #   firefox = {
  #     name = "Firefox";
  #     genericName = "Web Browser";
  #     exec = "firefox %U";
  #     terminal = false;
  #     categories = [ "Application" "Network" "WebBrowser" ];
  #     mimeType = [ "text/html" "text/xml" ];
  #   };
  # };



}
