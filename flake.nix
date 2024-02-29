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

    ags.url = "github:Aylur/ags";
    hyprland.url = "github:hyprwm/Hyprland";
    nix-colors.url = "github:misterio77/nix-colors";
    # nix-colors.inputs.base16-schemes.follows = "base16-schemes"; # Be sure to add this

  };

  outputs =
    inputs @ { self
    , nixpkgs
    , home-manager
    , nixvim
    , hyprland
    , nix-colors
    , ags
    }:
    let

      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      lib = pkgs.lib;

      username = "ck";
      hostname = "ck-nixos";
      desktop = "hyprland";
      fontSize = 22;
      fontFamily = "FantasqueSansM Nerd Font Mono";
      cursorSize = 32;
      majorColor = "#F7879A";
      # fontFamily = "MesloLGM Nerd Font";
      # userGroups = [ "networkmanager" "wheel" "keyd" "video" "input" ];

    in
    {
      formatter.${system} = pkgs.nixpkgs-fmt;

      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs lib username hostname desktop; };
        modules = [
          ./configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = import ./home-manager/home.nix;
            home-manager.extraSpecialArgs = { inherit inputs username fontSize fontFamily cursorSize majorColor; };
          }

        ];
      };

      homeConfigurations."ck" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home-manager/home.nix ];
        extraSpecialArgs = { inherit inputs username fontSize fontFamily cursorSize majorColor; };
      };

    };
}
