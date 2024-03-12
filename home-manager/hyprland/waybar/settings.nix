{
  settings = {

    mainBar =
      let
        # diskcolor = "white";
        # diskcolor = "#F7879A";
        playctl-format = {
          "Paused" = "<span foreground='#928374'>󰒮 󰐌 󰒭</span>";
          "Playing" = "<span foreground='#E5B9C6'>󰒮 󰏥 󰒭</span>";
        };
        virtWin10-tooltip = "host: <span color='orange'>sudo virsh list --all</span>\nnetwork: <span color='orange'>sudo virsh net-list --all</span>";
        clock-tooltip = " {:%Y-%m-%d %H:%M:%S (%B, %A)}\n<span>将来は神様になりたいです。</span>";
        playctl-exec = "playerctl -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
        HOME = "/home/ck";
        zenity-open = "zenity --text-info --filename=${HOME}/.config/waybar/keybindRef.txt  --title='Hyprland Cheat Sheet' --width=1000 --height=1400";
      in
      {

        "modules-left" = [
          "group/host"
          "hyprland/workspaces"
          "group/myPlayctl"
        ];
        # "modules-center" = [
        # ];
        "modules-right" = [
          "wlr/taskbar"
          "custom/cheatsheet"
          "group/myDisk"
          "group/mysoundDevice"
          "backlight"
          "battery"
          "tray"
          "clock"
        ];

        # "width" = 1880;
        # "width" = 2220;
        "margin-top" = 6;
        "margin-right" = 20;
        "margin-left" = 20;
        "layer" = "top";
        "position" = "top";

        "group/mysoundDevice" = {
          "drawer" = {
            "transition-duration" = 500;
            "transition-left-to-right" = false;
          };
          "modules" = [ "pulseaudio" "pulseaudio#microphone" ];
          "orientation" = "inherit";
        };
        "group/host" = {
          "drawer" = {
            "transition-duration" = 500;
            "transition-left-to-right" = true;
          };
          "orientation" = "inherit";
          "modules" = [
            "custom/launcher"
            "custom/virtWin10"
          ];
        };
        "group/myDisk" = {
          "modules" = [
            "disk#root"
            "disk#dotfiles"
            "disk#virtualMachine"
          ];
          "orientation" = "inherit";
        };
        "group/myPlayctl" = {
          "modules" = [ "custom/playerctl" "custom/playerlabel" ];
          "orientation" = "inherit";
        };

        # "custom/cava-internal" = {
        #   exec = "sleep 1s && cava-internal";
        #   tooltip = false;
        # };

        "custom/virtWin10" = {
          "format" = "<small> </small>";
          "on-click" = "exec pkexec sudo virsh start win10";
          "tooltip" = true;
          "tooltip-format" = virtWin10-tooltip;
          # "on-click-right" = "exec pkexec sudo virsh shutdown --mode acpi win10";
        };
        "custom/cheatsheet" = {
          "format" = " ";
          "on-click" = zenity-open;
          "tooltip" = true;
          "tooltip-format" = "Click to view Hyprland KeyBinding";
        };

        "custom/sep" = {
          "format" = " ▮ ";
          "tooltip" = false;
        };

        "custom/playerctl" = {
          "format" = "{icon}";
          "return-type" = "json";
          "max-length" = 64;
          "on-click-middle" = "playerctl play-pause";
          "on-click" = "playerctl previous";
          "on-click-right" = "playerctl next";
          "format-icons" = playctl-format;
          "exec" = playctl-exec;

        };

        "custom/playerlabel" = {
          "format" = " <small><span>{}</span></small>";
          "return-type" = "json";
          "max-length" = 48;
          "on-click-middle" = "playerctl play-pause";
          "on-click" = "playerctl previous";
          "on-click-right" = "playerctl next";
          "format-icons" = playctl-format;
          "exec" = playctl-exec;
        };

        "hyprland/workspaces" = {
          "active-only" = false;
          "all-outputs" = true;
          "on-click" = "activate";
          "format" = "{icon}";
          "format-icons" = {
            # "1" = "";
            # "2" = "";
            # "3" = "";
            # "4" = "";
            # "5" = "";
            # "active" = "";
            "default" = "";
            "active" = "";
            "urgent" = "";
            "empty" = "";
          };
          "persistent-workspaces" = {
            "*" = 5;
          };
        };
        "custom/launcher" = {
          "format" = " ";
          "on-click" = "pkill rofi || rofi -show drun -show-icons";
          "on-click-right" = "exec hypr_start $HOME/wallpapers/default.jpg";
          "tooltip" = false;
        };

        "wlr/taskbar" = {
          "all-outputs" = true;
          "format" = "{icon}";
          "icon-size" = 32;
          "on-click" = "activate";
          "on-click-middle" = "close";
          "tooltip-format" = "{name}";
        };
        "tray" = {
          "icon-size" = 32;
          "spacing" = 10;
        };
        "battery" = {
          "format" = "{icon} {capacity}%";
          "format-charging" = "󰉁 {capacity}%";
          "format-icons" = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
          "on-click" = "exec alacritty -e gotop";
          # "format-icons" = [ "" "" "" "" "" ];
          # "on-click" = "kitty sh -c gotop";

          "states" = {
            "critical" = 20;
            "good" = 70;
            "warning" = 30;
          };
          "tooltip" = false;
        };

        "disk#root" = {
          "format" = "<small>/:{percentage_used}%</small>";
          "interval" = 30;
          "states" = {
            "critical" = 90;
            "warning" = 80;
          };
        };
        "disk#dotfiles" = {
          "format" = "<small>d:{percentage_used}%</small>";
          "path" = "/home/ck/dotfiles";
          "interval" = 30;
          "states" = {
            "critical" = 90;
            "warning" = 80;
          };
        };
        "disk#virtualMachine" = {
          "format" = "<small>v:{percentage_used}%</small>";
          "path" = "/home/ck/virtualMachine";
          "interval" = 30;
          "states" = {
            "critical" = 90;
            "warning" = 80;
          };
        };
        "pulseaudio" = {
          "format" = "{icon} {volume}%";
          "format-icons" = {
            "default" = [ "" "" "" ];
            "headphone" = "";
            "headset" = "";
          };
          "format-muted" = "";
          "scroll-step" = 1;
          "on-click" = "pamixer --toggle-mute";
          "on-click-right" = "pavucontrol";
          "on-scroll-down" = "pamixer --decrease 1";
          "on-scroll-up" = "pamixer --increase 1";
        };
        "pulseaudio#microphone" = {
          "format-source" = " {volume}%";
          "format" = "{format_source}";
          "format-source-muted" = "";
          "on-scroll-down" = "pamixer --default-source  -d 2";
          "on-scroll-up" = "pamixer --default-source  -i 2";
        };
        "backlight" = {
          "device" = "intel_backlight";
          "format" = "{icon} {percent}%";
          "format-icons" = [ "󰃞" "󰃝" "󰃟" "󰃠" ];
          "min-length" = 6;
          "on-scroll-down" = "brightnessctl set 1%-";
          "on-scroll-up" = "brightnessctl set +1%";
          "tooltip" = false;
        };


        "clock" = {
          "format" = " {:%H:%M(%u)}";
          # "format" = "{:%B %d, %I:%M, %A}";
          "tooltip-format" = clock-tooltip;
        };


      };
  };
}
