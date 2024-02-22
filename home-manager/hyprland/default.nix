{ pkgs, config, inputs, ... }:
let
  cursorSize = 32;
in
{
  imports = [
    inputs.hyprland.homeManagerModules.default
    # ./conf
    ./waybar
    ./rofi
    ./kitty.nix
    ./dunst.nix
    ./gtk.nix
    # ./wayland-packages.nix
  ];

  # █░█ █▄█ █▀█ █▀█ █░░ ▄▀█ █▄░█ █▀▄
  # █▀█ ░█░ █▀▀ █▀▄ █▄▄ █▀█ █░▀█ █▄▀
  # hyprland with home-manager

  wayland.windowManager.hyprland.enable = true;

  wayland.windowManager.hyprland.settings = {
    monitor = ",preferred,auto,1.0";
    exec-once = [
      # "hypr_start $HOME/wallpapers/paper3.jpg"
      "hypr_start"
      "fcitx5"
      "${pkgs.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1"
      # "hypr_start"
      # "ags"
      # "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
    ];

    "$browser" = "google-chrome-stable";
    "$explorer" = "thunar";
    "$terminal" = "kitty";

    "$color0" = "rgba(ffccccee)";
    "$color1" = "rgba(f7879aee)";
    "$color2" = "rgba(282828aa)";
    "$color3" = "rgba(d3d3d3ee)";
    "$color4" = "rgba(3d3d3dee)";

    # "$color0" = "rgba(33ccffee)";
    # "$color1" = "rgba(00ff99ee)";
    # "$color2" = "rgba(595959aa)";
    # "$color3" = "rgba(1a1a1aee)";


    source = [
      # "~/.cache/wal/colors-hyprland.conf"
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
      border_size = 0;
      "col.active_border" = "$color0 $color1 45deg";
      "col.inactive_border" = "$color2";
      layout = "dwindle";
      allow_tearing = false;
    };

    decoration = {
      rounding = 6;
      # active_opacity=0.9;
      # inactive_opacity=0.9;
      blur = {
        enabled = true;

        passes = 6;
        size = 6;
        # noise = 0.01;

        blurls = [
          "waybar"
          "kitty"
        ];

      };
      drop_shadow = "yes";
      shadow_range = 8;
      shadow_render_power = 3;
      # shadow_offset = "3 3";

      "col.shadow" = "$color3";
      "col.shadow_inactive" = "$color4";

    };


    # animations = {
    #   enabled = true;
    #   bezier = [
    #     "overshot, 0.05, 0.9, 0.1, 1.05"
    #     "smoothOut, 0.5, 0, 0.99, 0.99"
    #     "smoothIn, 0.5, -0.5, 0.68, 1.5"
    #   ];
    #   animation = [
    #     "windows, 1, 5, overshot, slide"
    #     "windowsOut, 1, 3, smoothOut"
    #     "windowsIn, 1, 3, smoothOut"
    #     "windowsMove, 1, 4, smoothIn, slide"
    #     "border, 1, 5, default"
    #     "fade, 1, 5, smoothIn"
    #     "fadeDim, 1, 5, smoothIn"
    #     "workspaces, 1, 6, default"
    #   ];
    # };

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
      "float, class:^(org.fcitx.)$"

      # "workspace 1 silent,class:^(cool-retro-term.)$"
      # "workspace 2 silent,class:^(Google-chrome)$"
      # "workspace 2 silent,class:^(Brave-browser)$"
      # "workspace 2 silent,class:^(org.qutebrowser.qutebrowser)$"
      # "workspace 2 silent,class:^(firefox)$"
      # "workspace 2 silent,class:^(librewolf)$"
      # "workspace 3 silent,class:^(Code)$"
      # "workspace 4 silent,class:^(thunar)$"
      # "workspace 4 silent,class:^(Spotify)$"
      # "workspace 5 silent,class:^(org.telegram.desktop)$"
      # "workspace 6 silent,class:^(VirtualBox Machine)$"
      # "workspace 6 silent,class:^(virt-manager)$"

    ];


    bind =
      [
        # "$mod, F, exec, firefox"

        # "$mainMod, HOME, exec, ~/.config/hypr/scripts/start_eww"
        # "$mainMod CTRL, Space, exec, ags --toggle-window applauncher"
        # "$mainMod, escape, exec, eww close powermenu || eww open powermenu"

        # ", XF86AudioRaiseVolume, exec, ~/.config/eww/scripts/toggle_osd.sh --up"
        # ", XF86AudioLowerVolume, exec, ~/.config/eww/scripts/toggle_osd.sh --down"
        # ", XF86AudioMute, exec, ~/.config/eww/scripts/toggle_osd.sh --toggle"

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
        "$mainMod, RETURN, exec, $terminal"
        "$mainMod, SLASH, exec, code"
        "$mainMod SHIFT, SLASH, exec, code ~/nixos"
        "$mainMod CTRL, SLASH, exec, hx ~/nixos"
        "$mainMod, SPACE, exec, playerctl play-pause"
        "$mainMod, E, exec, $explorer"
        "$mainMod SHIFT, E, exec, kitty sh -c yazi"
        "$mainMod, A, exec, rofi -show drun -show-icons"
        "$mainMod SHIFT, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
        "$mainMod, B, exec, $browser"
        "$mainMod CTRL, W, exec, hypr_start"
        "ALT, R, exec, zathura ~/Desktop/Linux网络编程.pdf"

        ",Print, exec, grimblast --notify save screen"
        "SHIFT, Print, exec, grimblast --notify save area"
        "CTRL, Print, exec, grim -g \"$(slurp)\" - | swappy -f -"
        # ", Print, exec, grim $(xdg-user-dir PICTURES)/screenshots/$(date +'%s_grim.png') && notify-send \"Saved to ~/Pictures/screenshots\""
        # "ALT CTRL, Print, exec, grimblast copy area"
        # "CTRL, Print, exec, grim -g \"$(slurp)\" - | wl-copy"

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

}