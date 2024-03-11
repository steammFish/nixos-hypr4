{ pkgs, config, ... }:
let
  myapp-path = "/home/ck/.mybin";
  myapp-names = [
    "chatGPT"
    "google-translate"
    "google-drive"
    "netease-music"
    "qq-music"
    "youtube-music"
  ];
  desktopEntries = origName: {
    name = builtins.replaceStrings [ "-" ] [ " " ] origName; # 替换横线为空格用于显示名称
    exec = "${myapp-path}/${origName}.sh"; # 使用原始名称（包含横线）用于路径
    icon = "${myapp-path}/${origName}.png"; # 使用原始名称（包含横线）用于路径
    type = "Application";
    categories = [ "Network" ];
  };

  # noIconApp-names =[
  # ];
  # noIconDesktopEntries = origName: {
  #   name = builtins.replaceStrings [ "-" ] [ " " ] origName; # 替换横线为空格用于显示名称
  #   exec = "${myapp-path}/${origName}.sh"; # 使用原始名称（包含横线）用于路径
  #   icon = "${myapp-path}/default.png"; # 使用原始名称（包含横线）用于路径
  #   type = "Application";
  #   categories = [ "Network" ];
  # };
in
{
  xdg.desktopEntries = builtins.listToAttrs (map
    (origName: {
      name = builtins.replaceStrings [ "-" ] [ " " ] origName;
      value = desktopEntries origName;
    })
    myapp-names);
}
