## this is  ~/.bashrc

find_nix_package_location() {
  if [ -z "$1" ]; then
    echo "Usage: find_nix_package_location <package_name>"
    return 1
  fi

  local package_location=$(readlink -f "$(which $1)")

  [ -n "$package_location" ] && echo "Package '$1' is located at: $package_location" || echo "Package '$1' not found or has no specific location."
}

epr() {
  export all_proxy=http://192.168.43.1:10809/
  echo -e "\e[1;33m[=>]\e[0m have been set proxy $(all_proxy)."
}

docker_del() {
  local CONTAINER_NAME=chatgpt-web-midjourney-proxy
  docker rm -f $CONTAINER_NAME
}

docker_dep() {
    local APIKEY=hk-nllqa9100001090535469314960c396b67029ac12f0938e0

    docker run --name chatgpt-web-midjourney-proxy  -d -p 6015:3002 \
    -e OPENAI_API_KEY=$APIKEY \
    -e OPENAI_API_BASE_URL=https://api.openai-hk.com  \
    -e MJ_SERVER=https://api.openai-hk.com  \
    -e MJ_API_SECRET=$APIKEY  ydlhero/chatgpt-web-midjourney-proxy
}

gh() { 
  rg . | grep $1 
}

alias ls='eza --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'

alias b=bat
alias cr=clear
alias ulk=unlink
alias ex=exit
alias hy=Hyprland
alias ns=nix-shell

alias ds="docker start chatgpt-web-midjourney-proxy"
alias upd="sudo nixos-rebuild switch --flake /home/ck/nixos/"
alias updh="home-manager switch --flake /home/ck/nixos/"
alias nico='cd ~/nixos/ && ls'
alias sasu_wifi="nmcli device wifi connect scwl_dongqu password sasu1976"
alias qq-run="appimage-run /home/ck/nixos/home-manager/qq/linuxqq_3.2.5-20979_x86_64.AppImage"

# find package
alias list-gtk-themes="ls /nix/store/*/share/themes"
alias list-icon-themes="ls /nix/store/*/share/icons"

## edit config 
alias ez="hx ~/.zshrc";
alias es="hx ~/.config/hypr/start.sh"

## mount 
alias mnt="cd /mnt"
alias fdk="sudo fdisk -l"
alias umnt="sudo umount /mnt"
alias mntn3="sudo mount /dev/nvme0n1p3  /mnt --mkdir"
alias mnts3="sudo mount /dev/sda3 /mnt --mkdir"
alias mntv="sudo mount /dev/nvme0n1p6 /mnt --mkdir"


# █▀▀ ▀▄▀ █▀▀ █▀▀
# ██▄ █░█ ██▄ █▄▄

# ds || true
# filebrowser || true

