{ pkgs, config, username, ... }:

{
  users.extraGroups.vboxusers.members = [ username ];
  users.extraGroups.docker.members = [ username ];

  # █░█ █ █▀█ ▀█▀ █░█ ▄▀█ █░░ █▄▄ █▀█ ▀▄▀
  # ▀▄▀ █ █▀▄ ░█░ █▄█ █▀█ █▄▄ █▄█ █▄█ █░█
  virtualisation.virtualbox = {
    host = {
      enable = true;
      enableExtensionPack = true;
    };
    guest.enable = true;
  };


  # █▀▄ █▀█ █▀▀ █▄▀ █▀▀ █▀█
  # █▄▀ █▄█ █▄▄ █░█ ██▄ █▀▄

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}
