{ pkgs, config, inputs, ... }:
let
  cursorSize = 32;

in
{
  imports = [
    inputs.hyprland.homeManagerModules.default
    ./wayland-packages.nix
    ./conf.nix
    ./waybar
  ];

  # █░█ █▄█ █▀█ █▀█ █░░ ▄▀█ █▄░█ █▀▄
  # █▀█ ░█░ █▀▀ █▀▄ █▄▄ █▀█ █░▀█ █▄▀
  # hyprland with home-manager

  wayland.windowManager.hyprland.enable = true;

  wayland.windowManager.hyprland.settings = {
    monitor = ",preferred,auto,1.0";
    exec-once = [
      "hypr_start /home/ck/Pictures/default.jpg"
      # "hypr_start"
      "fcitx5"
      # "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
      "${pkgs.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1"
    ];

    source = [
      "~/.cache/wal/colors-hyprland.conf"
      "~/.config/hypr/extra.conf"
    ];

    env = [
      "XCURSOR_SIZE,${builtins.toString cursorSize}"
      "QT_QPA_PLATFORMTHEME,qt5ct"
    ];


    input = {
      kb_layout = "us";
      kb_options = "caps:swapescape";
      repeat_delay = 200;
      repeat_rate = 45;
      follow_mouse = 1;
      touchpad = {
        natural_scroll = "yes";
      };
      sensitivity = 0;
    };

    general = {
      gaps_in = 5;
      gaps_out = 20;
      border_size = 4;
      "col.active_border" = "$color2 $color6 45deg";
      "col.inactive_border" = "$color8";
      layout = "dwindle";
      allow_tearing = false;
    };

    decoration = {
      rounding = 10;
      blur = {
        enabled = true;
        # size = 3;
        # passes = 1;
        size = 10;
        passes = 2;
        blurls = "waybar";

      };
      drop_shadow = "yes";
      shadow_range = 8;
      shadow_render_power = 3;
      shadow_offset = "3 3";

      "col.shadow" = "$color11";

    };
    animations = {
      enabled = "yes";
      bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
      animation = [
        "windows, 1, 7, myBezier"
        "windowsOut, 1, 7, default, popin 80%"
        "border, 1, 10, default"
        "borderangle, 1, 8, default"
        "fade, 1, 7, default"
        "workspaces, 1, 6, default"
      ];
    };
    dwindle = {
      pseudotile = "yes";
      preserve_split = "yes";
    };
    master = {
      new_is_master = true;
    };
    gestures = {
      workspace_swipe = "on";
      workspace_swipe_fingers = 3;
      workspace_swipe_cancel_ratio = 0.2;
      workspace_swipe_distance = 400;
      workspace_swipe_min_speed_to_force = 10;
    };
    misc = {
      force_default_wallpaper = -1;
      enable_swallow = true;
      swallow_regex = "^(kitty)$";
    };
    "device:epic-mouse-v1" = {
      sensitivity = -0.5;
    };

    "$mainMod" = "SUPER";
    "$mod" = "SUPER";

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
      "ALT, mouse:272, resizewindow"
    ];

    windowrule = [
      "float, ^(steam)$"
      "float, ^(guifetch)$ "
      "float,^(nm-connection-editor)$ "
      "float,^(zenity)$ "
      "float,^(pavucontrol)$ "
      "float,title:^(New Text Note — Okular)$ "
      "float,title:^(org.gnome.Nautilus New Folder)$ "
      "float,title:^(Bluetooth Devices)(.*)$ "
      "float,title:^(Fcitx Configuration)(.*)$ "
      "float,title:^(Pinyin dictionary manager)(.*)$ "
      "float,title:^(.*)(Settings)$ "
      "float,title:^(.*)(Preferences)$ "
      "float,title:^(.*)(CopyQ)$ "
      "float,title:^(Oracle VM VirtualBox Manager)(.*)$ "
      "float,title:^(sh)$ "
      "nofullscreenrequest,title:^(Firefox — Sharing Indicator)$ "
      "float,title:^(Firefox — Sharing Indicator)$ "
      "move 100%-470 15,title:^(Firefox — Sharing Indicator)$ "
      "float,title:^(Open File)(.*)$ "
      "float,title:^(Open)(.*)$ "
      "float,title:^(Select a File)(.*)$ "
      "float,title:^(Choose wallpaper)(.*)$ "
      "float,title:^(Open Folder)(.*)$ "
      "float,title:^(Save As)(.*)$ "
      "float,title:^(Library)(.*)$"
    ];

    windowrulev2 = [
      "float, class:^(org.kde.polkit-kde-authentication-agent-1)$"
      "float, class:^(qt5ct)$"
      "float, class:^(nm-connection-editor)$"
      "float, class:^(thunar)$, title:^(File Operation Progress)$"
      "float, class:^(thunar)$, title:^(Confirm to replace files)$"
      "workspace 1 silent,class:^(cool-retro-term.)$"
      "workspace 2 silent,class:^(Google-chrome)$"
      "workspace 2 silent,class:^(Brave-browser)$"
      "workspace 2 silent,class:^(org.qutebrowser.qutebrowser)$"
      "workspace 2 silent,class:^(firefox)$"
      "workspace 2 silent,class:^(librewolf)$"
      "workspace 3 silent,class:^(Code)$"
      "workspace 4 silent,class:^(thunar)$"
      "workspace 4 silent,class:^(Spotify)$"
      "workspace 5 silent,class:^(org.telegram.desktop)$"
      "workspace 6 silent,class:^(VirtualBox Machine)$"
      "workspace 6 silent,class:^(virt-manager)$"

    ];


    bind =
      [
        # "$mod, F, exec, firefox"
        # ", Print, exec, grimblast copy area"

        ",XF86MonBrightnessDown, exec,brightnessctl set 10%-"
        ",XF86MonBrightnessUp, exec,brightnessctl set +10%"
        ",XF86AudioMicMute, exec, pamixer --default-source --toggle-mute"
        ",XF86AudioMute, exec, pamixer --toggle-mute"
        ",XF86AudioLowerVolume, exec, pamixer --decrease 5"
        ",XF86AudioRaiseVolume, exec, pamixer --increase 5"
        ",XF86AudioPlay, exec, playerctl play-pause"
        ",XF86AudioPause, exec, playerctl play-pause"

        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        "$mainMod, Q, exec, $terminal"
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, pseudo,"
        "$mainMod, J, togglesplit,"
        "$mainMod, G, fullscreen, 0"
        "$mainMod, T, toggleopaque, # transparent"

        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
        "$mainMod, RETURN, exec, kitty"
        "$mainMod, SLASH, exec, code"
        "$mainMod, SPACE, exec, playerctl play-pause"
        "$mainMod, F, exec, thunar"
        "$mainMod SHIFT, F, exec, kitty sh -c yazi"
        "$mainMod, A, exec, rofi -show drun -show-icons"
        "$mainMod SHIFT, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
        "$mainMod, B, exec, google-chrome-stable"
        "$mainMod CTRL, W, exec, pkill waybar && sleep 0.4 && waybar"
        ", Print, exec, scrs"
        "ALT, R, exec, zathura ~/Desktop/Linux网络编程.pdf"

        ''CTRL, Print, exec, grim -g "$(slurp)" - | wl-copy''
        ''SHIFT, Print, exec, grim -g "$(slurp)" - | swappy -f -''

      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList
          (
            x:
            let
              ws =
                let
                  c = (x + 1) / 10;
                in
                builtins.toString (x + 1 - (c * 10));
            in
            [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      );
  };

  # wayland.windowManager.hyprland.plugins = [
  #   inputs.hyprland-plugins.packages.${pkgs.system}.hyprbars
  #   "/absolute/path/to/plugin.so"
  # ];

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = cursorSize;
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };

    iconTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 14;
    };
  };


}
