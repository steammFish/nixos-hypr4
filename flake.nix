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

  };

  outputs =
    inputs @ { self
    , nixpkgs
    , home-manager
    , nixvim
    , hyprland
    }:
    let

      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      lib = pkgs.lib;

      globalVariable = {
        username = "ck"; # FIXME: global variable 
        hostname = "ck-nixos";
        # userGroups = ["networkmanager" "wheel" "keyd" "video" "input"  ];
        # desktop = "gnome"; # "gnome", "plasma" or  # FIXME: desktop change
      };

    in
    {
      formatter.${system} = pkgs.nixpkgs-fmt;

      nixosConfigurations.${globalVariable.hostname} = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs globalVariable; };
        modules = [
          ./configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${globalVariable.username} = import ./home-manager-ck/home.nix;
            home-manager.extraSpecialArgs = { inherit inputs self globalVariable; };
          }

        ];
      };

      homeConfigurations."ck" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home-manager-ck/home.nix ];
        extraSpecialArgs = { inherit inputs; };
      };


      homeConfigurations."mr" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home-manager-mr/home.nix ];
        extraSpecialArgs = { inherit inputs; };
      };

    };
}
