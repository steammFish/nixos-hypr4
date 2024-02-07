# { config
# , lib
# , pkgs
# , ...
# }:
# let
#   themeName = "WhiteSur-Dark-solid";
#   iconName = "Papirus-Dark";
#   cursorName = "Bibata-Modern-Ice";
# in
# {
#   gtk.enable = true;

#   home.packages = with pkgs; [
#     bibata-cursors
#     papirus-icon-theme
#     whitesur-gtk-theme
#     # whitesur-cursors
#     # whitesur-icon-theme
#   ];

#   gtk = {
#     gtk4.extraConfig.Settings = "gtk-application-prefer-dark-theme=1";
#     gtk3.extraConfig.Settings = "gtk-application-prefer-dark-theme=1";

#     theme.name = themeName;
#     iconTheme.name = iconName;
#     cursorTheme.name = cursorName;

#   };

# }

# # ❯ cat ~/.config/gtk-3.0/settings.ini
# # [Settings]
# # gtk-application-prefer-dark-theme=0

# # ❯ cat ~/.config/gtk-4.0/settings.ini
# # [Settings]
# # gtk-application-prefer-dark-theme=0

# # ❯ cat ~/.gtkrc-2.0
# # gtk-enable-animations=1
# # gtk-primary-button-warps-slider=0
# # gtk-toolbar-style=3
# # gtk-menu-images=1
# # gtk-button-images=1
# # gtk-cursor-theme-size=24
# # gtk-cursor-theme-name="breeze_cursors"
# # gtk-icon-theme-name="candy-icons"
# # gtk-font-name="Noto Sans,  10"


