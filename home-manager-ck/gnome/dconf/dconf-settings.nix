{
  keybinds =
    {

      # "org/gnome/desktop/wm/keybindings" = {
      #   close = "<Super>c";
      #   toggle-maximized = "<Super>g";
      # };

      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        ];
        help = "<Super>b";
        home = "<Super>e";
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Super>slash";
        command = "code";
        name = "launcher vscode";
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
        binding = "<Super>Return";
        command = "gnome-terminal";
        name = "launcher terminal";
      };

    };

  hardware =
    {
      "org/gnome/desktop/peripherals/mouse".speed = 1.0;
      "org/gnome/desktop/peripherals/touchpad" = {
        speed = 0.5;
        tap-to-click = true;
      };
      "org/gnome/desktop/peripherals/keyboard" = {
        delay = 220;
        repeat-interval = 50;
      };

      "org/gnome/desktop/interface" = {
        cursor-theme = "Bibata-Modern-Ice";
        show-battery-percentage = true;
      };
    };

  bar =
    {


      "org/gnome/shell".favorite-apps = [
        "org.gnome.Nautilus.desktop"
        "org.gnome.Console.desktop"
        "code.desktop"
        "google-chrome.desktop"
        "virtualbox.desktop"
        "youtube-music.desktop"
        "floorp.desktop"
        "org.gnome.Settings.desktop"
        "org.gnome.Extensions.desktop"
        "ca.desrt.dconf-editor.desktop"
      ];
    }



    }
