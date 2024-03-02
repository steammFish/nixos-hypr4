{ pkgs, config, ... }:
{

  # █▄░█ ▀█▀ █▀▀ █▀
  # █░▀█ ░█░ █▀░ ▄█
  # boot.supportedFilesystems = [ "ntfs" ];
  # NixOS uses NTFS-3G for NTFS support.

  # █▀█ █▀█ █░█░█ █▀▀ █▀█
  # █▀▀ █▄█ ▀▄▀▄▀ ██▄ █▀▄
  powerManagement.enable = true;
  services.power-profiles-daemon.enable = true;
  # Whether to enable thermald, the temperature management daemon
  services.thermald.enable = true;

  # █▄▄ █░░ █░█ █▀▀ ▀█▀ █▀█ █▀█ ▀█▀ █░█
  # █▄█ █▄▄ █▄█ ██▄ ░█░ █▄█ █▄█ ░█░ █▀█
  # https://nixos.wiki/wiki/Bluetooth
  # Enable Bluetooth support
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  # Pairing Bluetooth devices
  # 启用 blueman 服务，它提供了 blueman-applet 和 blueman-manager
  services.blueman.enable = true;

  # █▀█ █ █▀█ █▀▀ █░█░█ █ █▀█ █▀▀
  # █▀▀ █ █▀▀ ██▄ ▀▄▀▄▀ █ █▀▄ ██▄
  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };


  # services.mpd = {
  #   enable = true;
  #   musicDirectory = "/home/ck/Music";
  #   extraConfig =
  #     ''
  #       audio_output {
  #         type "pulse"
  #         name "Pulseaudio"
  #         server "127.0.0.1" # add this line - MPD must connect to the local sound server
  #       }
  #     '';

  #   # Optional:
  #   network.listenAddress = "any"; # if you want to allow non-localhost connections
  #   startWhenNeeded = true; # systemd feature: only start MPD service upon connection to its socket
  # };


}
