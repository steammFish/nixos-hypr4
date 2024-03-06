{
  settings = {

    mainBar = {

      "modules-left" = [
        "custom/launcher"
        "hyprland/workspaces"
        "group/myPlayctl"
      ];
      # "modules-center" = [
      # ];
      "modules-right" = [
        "wlr/taskbar"
        "group/mysoundDevice"
        "backlight"
        "battery"
        "disk#root"
        "disk#dotfiles"
        "tray"
        "clock"
      ];

      # "width" = 1880;
      "width" = 2220;
      "margin-top" = 6;
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

      "group/myPlayctl" = {
        "modules" = [ "custom/playerctl" "custom/playerlabel" ];
        "orientation" = "inherit";
      };

      "custom/playerctl" = {
        "format" = "{icon}";
        "return-type" = "json";
        "max-length" = 64;
        "on-click-middle" = "playerctl play-pause";
        "on-click" = "playerctl previous";
        "on-click-right" = "playerctl next";
        "format-icons" = {
          "Paused" = "<span foreground='#928374'>󰒮 󰐌 󰒭</span>";
          "Playing" = "<span foreground='#E5B9C6'>󰒮 󰏥 󰒭</span>";
        };
        "exec" = "playerctl -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";

      };

      "custom/playerlabel" = {
        "format" = " <span>{}</span>";
        "return-type" = "json";
        "max-length" = 48;
        "on-click-middle" = "playerctl play-pause";
        "on-click" = "playerctl previous";
        "on-click-right" = "playerctl next";
        "format-icons" = {
          "Paused" = "<span foreground='#928374'>󰒮 󰐌 󰒭</span>";
          "Playing" = "<span foreground='#E5B9C6'>󰒮 󰏥 󰒭</span>";
        };
        "exec" = "playerctl -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";

      };


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
        # "on-click-middle" = "exec wallpaper_default";
        "on-click" = "pkill rofi || rofi -show drun -show-icons";
        "on-click-right" = "exec hypr_start $HOME/wallpapers/default.jpg";
        "tooltip" = false;
      };

      # "custom/sep" = {
      #   "format" = ":";
      #   "tooltip" = false;
      # };

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
      "disk#root" = {
        "format" = "/ {percentage_used}";
        "interval" = 30;
        "states" = {
          "critical" = 90;
          "warning" = 80;
        };
      };

      "disk#dotfiles" = {
        "format" = "d {percentage_used}";
        "path" = "/home/ck/dotfiles";
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
