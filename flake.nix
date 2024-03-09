{
  description = "nix flake";
  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    # ags.url = "github:Aylur/ags";
    # nix-colors.url = "github:misterio77/nix-colors";
    # nix-colors.inputs.base16-schemes.follows = "base16-schemes"; # Be sure to add this

  };

  outputs =
    inputs @ { self
    , nixpkgs
    , home-manager
    , nixvim
    , hyprland
    # , nix-colors
    # , ags
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      lib = pkgs.lib;
      shareSpecialArgs = {
        inherit inputs;
        username = "ck";
        hostname = "ck-nixos";
        fontSize = 22;
        cursorSize = 32;
        fontFamily = "FantasqueSansM Nerd Font Mono";
        # fontFamily = "MesloLGM Nerd Font";
        majorColor = "#F7879A";
        userGroups = [ "networkmanager" "wheel" "keyd" "video" "input" "mpd" ];
      };

    in
    {
      formatter.${system} = pkgs.nixpkgs-fmt;
      nixosConfigurations."ck-nixos" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = shareSpecialArgs;
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users."ck" = import ./home-manager/home.nix;
            home-manager.extraSpecialArgs = shareSpecialArgs;
          }
        ];
      };
      homeConfigurations."ck" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home-manager/home.nix ];
        extraSpecialArgs = shareSpecialArgs;
      };

    };
}
