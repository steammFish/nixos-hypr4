{ pkgs, config, ... }:
{

  #   security.sudo = {
  #   enable = true;
  #   extraRules = [{
  #     commands = [
  #       {
  #         command = "${pkgs.libvirt}/bin/virsh";
  #         # command = "${pkgs.libvirt}/bin/virsh start";
  #         options = [ "NOPASSWD" ];
  #       }
  #     ];
  #     groups = [ "wheel" ];
  #   }];
  #   extraConfig = with pkgs; ''
  #     Defaults:picloud secure_path="${lib.makeBinPath [
  #       systemd
  #     ]}:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin"
  #   '';
  # };

}
