{ pkgs, config, ... }:

let
  yaziInit = ''
    ya() {
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
  environment.systemPackages = (with pkgs; [
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

  ]);

  programs.zsh.shellInit = yaziInit;
  programs.bash.interactiveShellInit = yaziInit;


}
