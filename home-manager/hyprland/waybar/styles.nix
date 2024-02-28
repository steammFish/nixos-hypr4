let
  fontsize = "24px";
in

{

  styles =
    ''
      /* @import "/home/ck/.cache/wal/colors-waybar.css"; */

      @define-color bgBar rgba(0,0,0,0.3);
      @define-color bgWidget rgba(0,0,0,0.4);

      @define-color fgWhite #ffffff;
      @define-color bgBlack #000000;
      @define-color fgSakuraPink @fgWhite; 

      @define-color InactiveLightGray rgba(255,255,255,0.4);
      @define-color activeRosePink #F7879A;

      @define-color warningRed #f53c3c;
      @define-color healthGreen #26A65B;

      * {
        font-family:'Monospace','Font Awesome 6 Free';
        font-size: ${fontsize};
        padding: 0;
        margin: 0;
        border: none;
      }

      window#waybar {
        transition-property: background-color;
        transition-duration: .5s;
        border-radius: 10px;
        /* background: transparent; */
        background-color: @bgBar;
      }

      button.urgent {
        background-color:  @warningRed;
      }

      /* #workspaces button, */
      #workspaces,
      #custom-launcher,
      #clock,
      #battery,
      #disk,
      #backlight,
      #pulseaudio
      {
        margin: 0px 4px;
        padding:  0px 8px;
        min-width: 28px;
        color: @fgWhite;
        border-radius: 10px;
        /* background-color: rgba(0,0,0,0.3); */
        background-color: @bgWidget;
        margin-top: 2px;
        margin-bottom: 2px;
        
      }

      #clock {
        font-weight: bold;
      }

      #battery.charging, #battery.plugged {
        color: @fgWhite;
        background-color: @healthGreen;
      }

      @keyframes blink {
        to {
          background-color: @fgWhite;
          color: @bgBlack;
        }
      }

      #battery.critical:not(.charging) ,
      #battery.warning:not(.charging) {
        background-color: @warningRed;
        color: @fgWhite;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      label:focus {
        background-color: @bgBlack;
      }

      #network.disconnected {
        background-color: @warningRed;
      }

      #tray > .passive {
        -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
        -gtk-icon-effect: highlight;
        background-color: @warningRed;
      }

      #workspaces button {
        margin: 0px 8px;
        color: @fgSakuraPink;
      }

       #workspaces button.empty { 
       color: @InactiveLightGray;
       } 

      #workspaces button.active {
        color: @activeRosePink;
      }

      #custom-sep,
      #tray,
      #taskbar button {
        font-weight: bold;
        background: none;
        margin: 0px 5px;
      }

      #custom-launcher {
        margin-left: 20px;
      }
      #tray {
        margin-right: 20px;
      }

    '';



}
