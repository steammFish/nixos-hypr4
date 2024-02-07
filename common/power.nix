{ pkgs, ... }: {
  powerManagement.enable = true;

  services.power-profiles-daemon.enable = true;
  # Whether to enable thermald, the temperature management daemon
  services.thermald.enable = true;

}
