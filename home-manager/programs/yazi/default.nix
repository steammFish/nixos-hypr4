{ pkgs, config, ... }:
let
  yaziConf = ./yazi_preset;
in
{

  home.packages = with pkgs; [
    # environment.systemPackages = with pkgs; [
    yazi
    file # (for file type detection)
    # nerd-fonts # (recommended)
    ffmpegthumbnailer # (for video thumbnails)
    unrar # (for archive preview)
    jq # (for JSON preview)
    poppler_utils # (for PDF preview)
    fd # (for file searching)
    ripgrep # (for file content searching)
    fzf # (for quick file subtree navigation)
    zoxide # (for historical directories navigation)

  ];

  home.file = {
    ".config/yazi".source = yaziConf;
  };


}
