
# export CK_NIXOS_CONFIGURE="/home/ck/nixos-hypr4"
export CK_NIXOS_CONFIGURE="/home/ck/dotfiles/home/nixos-hypr4"
export EDITOR="hx"
# export PATH="$HOME/.local/bin:$PATH"

alias update_nixos="sudo nixos-rebuild switch --flake $CK_NIXOS_CONFIGURE"
alias update_home="home-manager switch --flake $CK_NIXOS_CONFIGURE"
alias nman='NVIM_MANPAGER=1 MANPAGER="nvim +Man!" man'
alias tree="eza --tree"

find_nix_packages(){  readlink -f "$(which $1)"; }
find_all_theme() { find /nix/store -type d -path "*/share/themes/*" | awk -F'/share/themes/' '{print $2}' | awk -F'/' '{print $1}' | sort -u; }
