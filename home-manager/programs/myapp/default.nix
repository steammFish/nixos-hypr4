{ pkgs, config, ... }:

{
  imports = [
    ./entrys.nix
  ];

  home.file = {
    ".mybin".source = ./myapp-res;
  };

  xdg.desktopEntries =
    let
      myapp-path = "/home/ck/.mybin";
    in
    {
      linux-qq = {
        name = "Linux QQ";
        exec = "${myapp-path}/qq/launch_linuxqq.sh";
        icon = "${myapp-path}/qq/tencent-qq.png";
        type = "Application";
        categories = [ "Network" ];
      };
    };
}

# xdg.dataFile = {
#   "applications/linuxqq.desktop".source = ./qq/linuxqq.desktop;
# };

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

