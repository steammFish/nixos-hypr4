{ config, pkgs, ... }:
{

  # █▄▄ █░░ █░█ █▀▀ ▀█▀ █▀█ █▀█ ▀█▀ █░█
  # █▄█ █▄▄ █▄█ ██▄ ░█░ █▄█ █▄█ ░█░ █▀█
  # https://nixos.wiki/wiki/Bluetooth

  # Enable Bluetooth support
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  # Pairing Bluetooth devices
  # 启用 blueman 服务，它提供了 blueman-applet 和 blueman-manager
  services.blueman.enable = true;

  # █▄░█ ▀█▀ █▀▀ █▀
  # █░▀█ ░█░ █▀░ ▄█

  # boot.supportedFilesystems = [ "ntfs" ];
  # NixOS uses NTFS-3G for NTFS support.


}
