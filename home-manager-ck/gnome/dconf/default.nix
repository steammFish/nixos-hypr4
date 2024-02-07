{ config
, pkgs
, lib
, ...
}:

let
  gnomeSettings = import ./dconf-settings.nix;
in
{

  # imports = [ ./packages.nix ];

  dconf = {
    enable = true;
    settings =
      lib.mkMerge [
        gnomeSettings.hardware
        gnomeSettings.bar
        gnomeSettings.keybinds
      ];
  };

}

# 在 GNOME 终端中，配置文件的 ID 通常是自动生成的一串 UUID，用于唯一标识每个配置文件。
# 要确保这个 ID 在 dconf 的 GNOME 终端配置文件中是唯一的。使用 uuidgen 将输在 GNOME 
# 终端中，配置文件的 ID 通常是自动生成的一串 UUID，用于唯一标识每个配置文件。出一个新
# 的 UUID.


