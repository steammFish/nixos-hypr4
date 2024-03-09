{
  settings = {

    mainBar =
      let
        # diskcolor = "white";
        diskcolor = "#F7879A";
        playctl-format = {
          "Paused" = "<span foreground='#928374'>󰒮 󰐌 󰒭</span>";
          "Playing" = "<span foreground='#E5B9C6'>󰒮 󰏥 󰒭</span>";
        };
        clock-tooltip = "<span> {:%Y-%m-%d %H:%M:%S %A}</span>\n将来は神様になりたいです。";
        playctl-exec = "playerctl -a metadata --format '{\"text\": \"{{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";

      in
      {

        "modules-left" = [
          "custom/launcher"
          "hyprland/workspaces"
          "group/myPlayctl"
        ];
        # "modules-center" = [
        # ];
        "modules-right" = [
          "wlr/taskbar"
          "group/myDisk"
          "group/mysoundDevice"
          "backlight"
          "battery"
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
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
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
          "on-click" = "pkill rofi || rofi -show drun -show-icons";
          "on-click-right" = "exec hypr_start $HOME/wallpapers/default.jpg";
          "tooltip" = false;
        };

        "custom/sep" = {
          "format" = " ▮ ";
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

        "disk#root" = {
          "format" = "<small><span foreground='${diskcolor}'>/:{percentage_used}</span></small>";
          "interval" = 30;
          "states" = {
            "critical" = 90;
            "warning" = 80;
          };
        };
        "disk#dotfiles" = {
          "format" = "<small> <span foreground='${diskcolor}'>d:{percentage_used}</span></small>";
          "path" = "/home/ck/dotfiles";
          "interval" = 30;
          "states" = {
            "critical" = 90;
            "warning" = 80;
          };
        };
        "disk#virtualMachine" = {
          "format" = "<small> <span foreground='${diskcolor}'>v:{percentage_used}</span></small>";
          "path" = "/home/ck/virtualMachine";
          "interval" = 30;
          "states" = {
            "critical" = 90;
            "warning" = 80;
          };
        };

        "clock" = {
          "format" = " {:%H:%M}";
          "format-alt" = "{:%A, %B %d, %Y (%R)}  ";
          "tooltip-format" = clock-tooltip;
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
