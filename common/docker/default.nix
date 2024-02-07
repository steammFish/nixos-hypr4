{ config, pkgs, ... }:
let
  username = "ck";
in
{
  imports = [
    # ./chatgpt-openai-hk.nix
  ];

  # █▀▄ █▀█ █▀▀ █▄▀ █▀▀ █▀█
  # █▄▀ █▄█ █▄▄ █░█ ██▄ █▀▄

  users.extraGroups.docker.members = [ username ];
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}
