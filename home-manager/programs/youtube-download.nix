{ config, pkgs, ... }:
let
  yt-dlp =
    ''
      --ignore-errors
      -o ~/Videos/%(title)s.%(ext)s
      # Prefer 1080p or lower resolutions
      -f bestvideo[ext=mp4][width<=2000][height<=1200]+bestaudio[ext=m4a]/bestvideo[ext=webm][width<=2000][height<=1200]+bestaudio[ext=webm]/bestvideo[width<=2000][height<=1200]+bestaudio/best[width<=2000][height<=1200]/best
    '';
in
{

  home.file = {
    ".config/yt-dlp/config".text = yt-dlp;
  };

  home.packages = with pkgs;[
    tlp
    tartube-yt-dlp
  ];

}