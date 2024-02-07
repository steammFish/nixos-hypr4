{ config, pkgs, inputs, ... }:
let
  home-manager = inputs.home-manager;
  username = "user22";

in

{

  imports = [

    home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${username} = import ./home.nix;
      home-manager.extraSpecialArgs = { inherit inputs; };
    }
  ];

  programs.hyprland.enable = true;

  users.users.user22 = {
    isNormalUser = true;
    description = username;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      # firefox
      # thunderbird
    ];
  };


}
