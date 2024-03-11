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
    name = builtins.replaceStrings [ "-" ] [ " " ] origName;
    exec = "${myapp-path}/${origName}.sh";
    icon = "${myapp-path}/${origName}.png";
    type = "Application";
    categories = [ "Network" ];
  };

in
{
  xdg.desktopEntries = builtins.listToAttrs (map
    (origName: {
      name = builtins.replaceStrings [ "-" ] [ " " ] origName;
      value = desktopEntries origName;
    })
    myapp-names);
}
