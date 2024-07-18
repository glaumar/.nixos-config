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
            iconTasks = {
              launchers = [
                "applications:org.kde.dolphin.desktop"
                "applications:firefox.desktop"
              ];
            };
          }
          "org.kde.plasma.panelspacer"

          {
            systemTray.items = {
              shown = [
              ];
              hidden = [
              ];
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
        Wayland.InputMethod = "/run/current-system/sw/share/applications/org.fcitx.Fcitx5.desktop";
      };
    };

    shortcuts = {
      yakuake = {
        "toggle-window-state" = "Meta+Return";
      };
    };


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

