let
  fontsize = "24px";
in

{

  styles =
    ''
      @import "/home/ck/.cache/wal/colors-waybar.css";

      * {
        font-family:'Monospace','Font Awesome 6 Free';
        font-size: ${fontsize};
        padding: 0;
        margin: 0;
        border: none;
      }

      window#waybar {
        background: transparent;
        transition-property: background-color;
        transition-duration: .5s;
      }

      button.urgent {
        background-color: #eb4d4b;
      }

      #workspaces button,
      #custom-launcher,
      #clock,
      #battery,
      #disk,
      #backlight,
      #pulseaudio
      {
        margin: 2px 4px;
        padding:  2px 8px;
        min-width: 28px;
        background-color: rgba(0,0,0,0.3);
        color: #ffffff;
        border-radius: 10px;
      }

      #battery
      {
        font-weight: bold;
      }

      #battery.charging, #battery.plugged {
        color: #ffffff;
        background-color: #26A65B;
      }

      @keyframes blink {
        to {
          background-color: #ffffff;
          color: #000000;
        }
      }

      #battery.critical:not(.charging) ,
      #battery.warning:not(.charging) {
        background-color: #f53c3c;
        color: #ffffff;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      label:focus {
        background-color: #000000;
      }

      #network.disconnected {
        background-color: #f53c3c;
      }

      #tray > .passive {
        -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
        -gtk-icon-effect: highlight;
        background-color: #eb4d4b;
      }

      #workspaces button
      {
        background-color: @background;
        color: @color1;
      }

      #workspaces button.empty {
        color: @color2;
      }

      #workspaces button.active {
        background-color: @color3;
      }
      #custom-sep,
      #tray,
      #taskbar button {
        font-weight: bold;
        background: none;
        margin: 0px 5px;
      }

      #custom-launcher {
        margin-left: 30px;
      }
      #tray {
        margin-right: 30px;
      }

    '';



}
