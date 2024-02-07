{ pkgs, config, ... }:
let
  username = "ck";
in
{

  # █░█ █ █▀█ ▀█▀ █░█ ▄▀█ █░░ █▄▄ █▀█ ▀▄▀
  # ▀▄▀ █ █▀▄ ░█░ █▄█ █▀█ █▄▄ █▄█ █▄█ █░█

  users.extraGroups.vboxusers.members = [ username ];
  virtualisation.virtualbox = {
    host = {
      enable = true;
      enableExtensionPack = true;
    };
    guest.enable = true;
  };

}
