{ pkgs, config, username, ... }:

{

  # █░█ █ █▀█ ▀█▀ █░█ ▄▀█ █░░ █▄▄ █▀█ ▀▄▀
  # ▀▄▀ █ █▀▄ ░█░ █▄█ █▀█ █▄▄ █▄█ █▄█ █░█
  # users.extraGroups.vboxusers.members = [ username ];

  # virtualisation.virtualbox = {
  #   host = {
  #     enable = true;
  #     enableExtensionPack = true;
  #   };
  #   guest.enable = true;
  # };


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


  # █▀█ █▀▀ █▀▄▀█ █░█
  # ▀▀█ ██▄ █░▀░█ █▄█

  # Enable dconf (System Management Tool)
  programs.dconf.enable = true;

  # Add user to libvirtd group
  users.users."${username}".extraGroups = [ "libvirtd" ];

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    win-virtio
    win-spice
    gnome.adwaita-icon-theme
    # bridge-utils
  ];

  # Manage the virtualisation services
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;

}

# 查看网络
# $ sudo virsh net-list --all

# qemu 启动网络
# $ sudo virsh net-start default

# qemu 网络自启
# $ sudo virsh net-autostart default

# 修改为用户态网络
# ```
# <interface type="user">
#   <mac address="52:54:00:f7:b9:f5"/>
#   <model type="e1000e"/>
#   <address type="pci" domain="0x0000" bus="0x01" slot="0x00" function="0x0"/>
# </interface>
# ```
