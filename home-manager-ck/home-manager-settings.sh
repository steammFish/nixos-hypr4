nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager && nix-channel --update || true 
nix-shell '<home-manager>' -A install || true

