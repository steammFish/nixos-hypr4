
export CK_NIXOS_CONFIGURE="/home/ck/nixos-hypr4"
export EDITOR="hx"

alias update_nixos="sudo nixos-rebuild switch --flake $CK_NIXOS_CONFIGURE"
alias update_home="home-manager switch --flake $CK_NIXOS_CONFIGURE"

alias nman='NVIM_MANPAGER=1 MANPAGER="nvim +Man!" man'
