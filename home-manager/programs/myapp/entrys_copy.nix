# { pkgs, config, ... }:
# {
#   xdg.desktopEntries =
#     let
#       myapp-path = "/home/ck/.mybin";
#     in
#     {
#       youtube-music = {
#         name = "youtube-music";
#         exec = "${myapp-path}/youtube-music.sh";
#         icon = "${myapp-path}/youtube-music.png";
#         type = "Application";
#         categories = [ "Network" ];
#       };

#       qq-music = {
#         name = "qq-music";
#         exec = "${myapp-path}/qq-music.sh";
#         icon = "${myapp-path}/qq-music.png";
#         type = "Application";
#         categories = [ "Network" ];
#       };

#       netease-music = {
#         name = "netease-music";
#         exec = "${myapp-path}/netease-music.sh";
#         icon = "${myapp-path}/netease-music.png";
#         type = "Application";
#         categories = [ "Network" ];
#       };

#       chatGPT = {
#         name = "ChatGPT";
#         exec = "${myapp-path}/chatGPT.sh";
#         icon = "${myapp-path}/chatGPT.png";
#         type = "Application";
#         categories = [ "Network" ];
#       };

#       google-translate = {
#         name = "google-translate";
#         exec = "${myapp-path}/google-translate.sh";
#         icon = "${myapp-path}/google-translate.png";
#         type = "Application";
#         categories = [ "Network" ];
#       };
#     };
# }
