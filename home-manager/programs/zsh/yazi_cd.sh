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

