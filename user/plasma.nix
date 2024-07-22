{ config, ... }:

{
  programs.plasma = {
    enable = true;
    workspace = {
      clickItemTo = "open";
      lookAndFeel = "org.kde.breezedark.desktop";
    };

    panels = [
      # Windows-like panel at the bottom
      {
        location = "bottom";
        floating = true;
        height = 56;
        widgets = [
          {
            kickoff = {
              sortAlphabetically = true;
              icon = "nix-snowflake-white";
            };
          }
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.pager"

          "org.kde.plasma.panelspacer"
          {
            iconTasks =
              {
                launchers = [
                  "applications:org.kde.dolphin.desktop"
                  "applications:firefox.desktop"
                ];
                behavior.middleClickAction = "close";
              };
          }
          "org.kde.plasma.panelspacer"

          {
            systemTray = {
              icons.scaleToFit = true;
            };
          }

          {
            digitalClock = {
              calendar.firstDayOfWeek = "sunday";
              time.format = "24h";
            };
          }

          "org.kde.plasma.showdesktop"
        ];

      }
    ];

    configFile = {
      kwinrc = {
        Desktops.Number = 2;
        Wayland.InputMethod = "org.fcitx.Fcitx5.desktop";
      };
    };

    shortcuts = {
      kwin = {
        "Window Close" = "Meta+Esc";
      };
      yakuake = {
        "toggle-window-state" = "Meta+Return";
      };
    };

    window-rules = [
      {
        description = "Dolphin";
        match = {
          window-class = {
            value = "dolphin";
            type = "exact";
          };
          window-types = [ "normal" ];
        };
        apply = {
          noborder = {
            value = true;
            apply = "force";
          };
        };
      }

      {
        description = "org.telegram.desktop";
        match = {
          window-class = {
            value = "telegram-desktop org.telegram.desktop";
            type = "exact";
          };
          window-types = [ "normal" ];
        };
        apply = {
          noborder = {
            value = true;
            apply = "force";
          };
        };
      }

      {
        description = "org.kde.konsole";
        match = {
          window-class = {
            value = "konsole org.kde.konsole";
            type = "exact";
          };
          window-types = [ "normal" ];
        };
        apply = {
          noborder = {
            value = true;
            apply = "force";
          };
        };
      }

      {
        description = "firefox";
        match = {
          window-class = {
            value = "firefox firefox";
            type = "exact";
          };
          window-types = [ "normal" ];
        };
        apply = {
          noborder = {
            value = true;
            apply = "force";
          };
        };
      }

      {
        description = "Calibre";
        match = {
          window-class = {
            value = "calibre-gui";
            type = "substring";
          };
          window-types = [ "normal" ];
        };
        apply = {
          noborder = {
            value = true;
            apply = "force";
          };
        };
      }
    ];

  };

  xdg.configFile =
    let
      conf_home = "${config.home.homeDirectory}/.nixos-config/dotfiles/.config";
    in
    with config.lib.file;  {
      # autostart
      "autostart/org.kde.yakuake.desktop".text = ''
        [Desktop Entry]
        Categories=Qt;KDE;System;TerminalEmulator;
        Comment=A drop-down terminal emulator based on KDE Konsole technology.
        DBusActivatable=true
        Exec=yakuake
        GenericName=Drop-down Terminal
        Icon=yakuake
        Name=Yakuake
        StartupNotify=false
        Terminal=false
        Type=Application
      '';

      # kde app
      "konsolerc".source = mkOutOfStoreSymlink "${conf_home}/konsolerc";
      "yakuakerc".source = mkOutOfStoreSymlink "${conf_home}/yakuakerc";

      # fcitx5
      "fcitx5".source = mkOutOfStoreSymlink "${conf_home}/fcitx5";
    };

  xdg.dataFile =
    let
      data_home = "${config.home.homeDirectory}/.nixos-config/dotfiles/.local/share";
    in
    with config.lib.file;  {
      # konsole
      "konsole/glaumar.profile".source = mkOutOfStoreSymlink "${data_home}/konsole/glaumar.profile";
    };
}

