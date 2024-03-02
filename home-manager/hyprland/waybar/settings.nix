{
  settings = {

    mainBar = {


      "group/mysoundDevice" = {
        "drawer" = {
          "transition-duration" = 500;
          "transition-left-to-right" = false;
        };
        "modules" = [ "pulseaudio" "pulseaudio#microphone" ];
        "orientation" = "inherit";
      };
      "layer" = "top";
      "position" = "top";
      "width" = 1880;
      "margin-top" = 6;
      "modules-left" = [ "custom/launcher" "clock" "battery" "disk" ];
      "modules-right" = [ "group/mysoundDevice" "backlight" "tray" ];
      "modules-center" = [ "hyprland/workspaces" "wlr/taskbar" ];

      # "mpd" = {
      #   "format" = "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {album} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S}) ";
      #   "format-disconnected" = "Disconnected ";
      #   "format-stopped" = "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ";
      #   "interval" = 10;
      #   "consume-icons" = {
      #     "on" = " "; # Icon shows only when "consume" is on
      #   };
      #   "random-icons" = {
      #     "off" = "<span color=\"#f53c3c\"></span> "; # Icon grayed out when "random" is off
      #     "on" = " ";
      #   };
      #   "repeat-icons" = {
      #     "on" = " ";
      #   };
      #   "single-icons" = {
      #     "on" = "1 ";
      #   };
      #   "state-icons" = {
      #     "paused" = "";
      #     "playing" = "";
      #   };
      #   "tooltip-format" = "MPD (connected)";
      #   "tooltip-format-disconnected" = "MPD (disconnected)";
      # };

      "hyprland/workspaces" = {
        "active-only" = false;
        "all-outputs" = true;
        "on-click" = "activate";
        "format" = "{icon}";
        "format-icons" = {
          "1" = "";
          "2" = "";
          "3" = "";
          "4" = "";
          "5" = "";
          # "6" = "❻";
          # "7" = "❼";
          # "8" = "❽";
          # "9" = "❾";
          "default" = "";
          # "empty" = "";
          # "active" = "";
          # "urgent" = "";
        };
        "persistent-workspaces" = {
          "*" = 5;
        };
      };
      "custom/launcher" = {
        "format" = " ";
        # "on-click" = "pkill wofi || wofi --show drun --gtk-dark";
        "on-click" = "pkill rofi || rofi -show drun -show-icons";
        "on-click-middle" = "exec wallpaper_default";
        "on-click-right" = "exec wallpaper_random gif";
        "tooltip" = false;
      };

      "custom/sep" = {
        "format" = ":";
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
        "format" = "{icon} {capacity}";
        "format-charging" = "󰉁 {capacity}";
        "format-icons" = [ "" "" "" "" "" ];
        "on-click" = "kitty sh -c gotop";
        "states" = {
          "critical" = 20;
          "good" = 95;
          "warning" = 30;
        };
        "tooltip" = false;
      };
      "disk" = {
        "format" = " {percentage_used}";
        "interval" = 30;
        "states" = {
          "critical" = 90;
          "warning" = 80;
        };
      };
      "clock" = {
        "calendar" = {
          "format" = {
            "today" = "<span color='#a6e3a1'><b><u>{}</u></b></span>";
          };
          "mode" = "month";
          "mode-mon-col" = 3;
          "on-click-right" = "mode";
          "on-scroll" = 1;
          "weeks-pos" = "right";
        };
        "format" = " {:%H:%M(%u)}";
        "tooltip-format" = "<big><span color='orange'> {:%Y-%m-%d %H:%M:%S %A}</span></big>\n<tt><big>{calendar}</big></tt>";
      };
      "pulseaudio" = {
        "format" = "{icon} {volume}";
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
        "format" = "{format_source}";
        "format-source" = " {volume}";
        "format-source-muted" = "";
        "on-scroll-down" = "pamixer --default-source  -d 2";
        "on-scroll-up" = "pamixer --default-source  -i 2";
      };
      "backlight" = {
        "device" = "intel_backlight";
        "format" = "{icon} {percent}";
        "format-icons" = [ "󰃞" "󰃝" "󰃟" "󰃠" ];
        "min-length" = 6;
        "on-scroll-down" = "brightnessctl set 1%-";
        "on-scroll-up" = "brightnessctl set +1%";
        "tooltip" = false;
      };


    };
  };
}
