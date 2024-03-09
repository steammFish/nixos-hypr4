let
  # fontsize = builtins.toString fontSize + 2;
  fontsize = "26";
  # fontFamily = "'FantasqueSansM Nerd Font', 'Monospace','Font Awesome 6 Free'";
  fontFamily = "'FantasqueSansM Nerd Font', 'Font Awesome 6 Free'";
in

{

  styles =
    ''
      /* @import "/home/ck/.cache/wal/colors-waybar.css"; */

      @define-color bgBar rgba(0,0,0,0.4);
      @define-color bgWidget rgba(0,0,0,0.8);
      @define-color bgBlack #000000;
      @define-color fgWhite #ffffff;
      @define-color fgSakuraPink @fgWhite; 

      @define-color InactiveLightGray rgba(255,255,255,0.4);
      @define-color activeRosePink #F7879A;

      @define-color warningRed #f53c3c;
      @define-color healthGreen #26A65B;

      /* @define-color bgWidget rgba(0,0,0,0.4); */

      * {
        font-family: ${fontFamily};
        font-size: ${fontsize};
        padding: 0;
        margin: 0;
        border: none;
      }

      window#waybar {
        transition-property: background-color;
        transition-duration: .5s;
        background-color: @bgBar;
        /* border-radius: 10px;  */
        /* background: transparent; */
        /* border: 1px solid @activeRosePink; */
      }

      button.urgent {
        background-color:  @warningRed;
      }

      #myDisk,
      #taskbar,
      #custom-sep,
      #tray,
      #myPlayctl,
      #workspaces,
      #custom-launcher,
      #clock,
      #battery,
      #backlight,
      #pulseaudio
      {
        margin: 4px 4px;
        padding:  0px 8px;
        border-radius: 8px;
        color: @fgWhite;
        background: transparent;
        /* background-color: rgba(0,0,0,0.3); */
        /* background-color: @bgWidget; */
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
        margin: 0px 5px;
        color: @fgSakuraPink;
        padding-right: 12px;
        padding-left: 2px;
        /* min-width: 32px;  */
      } 

       #workspaces button.empty { 
       color: @InactiveLightGray;
       } 

      #workspaces button.active {
        color: @activeRosePink;
      }

      #custom-launcher {
        margin-left: 20px;
      }

      #clock { 
        margin-right: 20px;
        font-weight: bold; 
      }

      #taskbar button {
        margin: 0px 4px;
      } 

      #workspaces { background-color: @bgWidget; } 
      #backlight { padding: 0; }
      #tray { background-color: @InactiveLightGray; }

    '';



}
