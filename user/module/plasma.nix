{ config, dotfile, pkgs, ... }:

{
  # config example: 
  #   https://github.com/nix-community/plasma-manager/blob/trunk/examples/home.nix

  home.packages = with pkgs.kdePackages; [
    partitionmanager
    ksystemlog
    plasma-browser-integration
  ];

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
              icon = "nix-snowflake";
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
                  "applications:firefox-devedition.desktop"
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

    # ~/.config/kglobalshortcutsrc
    shortcuts = {
      kwin = {
        "Window Close" = "Meta+Esc";
        "Window Fullscreen" = "Meta+F";
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
            apply = "initially";
          };
        };
      }

      {
        description = "Element";
        match = {
          window-class = {
            value = "electron Element";
            type = "exact";
          };
          window-types = [ "normal" ];
        };
        apply = {
          noborder = {
            value = true;
            apply = "initially";
          };
        };
      }

      {
        description = "Discord";
        match = {
          window-class = {
            value = "Discord discord";
            type = "exact";
          };
          window-types = [ "normal" ];
        };
        apply = {
          noborder = {
            value = true;
            apply = "initially";
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
            apply = "initially";
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
            apply = "initially";
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
          title = {
            value = "Mozilla Firefox";
            type = "substring";
          };
        };
        apply = {
          noborder = {
            value = true;
            apply = "initially";
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
            apply = "initially";
          };
        };
      }
    ];

  };

  xdg.configFile = with config.lib.file;  {
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
    "konsolerc".source = mkOutOfStoreSymlink "${dotfile.conf}/konsolerc";
    "yakuakerc".source = mkOutOfStoreSymlink "${dotfile.conf}/yakuakerc";
    "dolphinrc".source = mkOutOfStoreSymlink "${dotfile.conf}/dolphinrc";

    # fcitx5
    "fcitx5".source = mkOutOfStoreSymlink "${dotfile.conf}/fcitx5";
  };

  xdg.dataFile = with config.lib.file;  {
    # konsole/yakuake
    "konsole/glaumar.profile".source = mkOutOfStoreSymlink "${dotfile.data}/konsole/glaumar.profile";
    "konsole/Breeze.colorscheme".source = mkOutOfStoreSymlink "${dotfile.data}/konsole/Breeze.colorscheme";
    "user-places.xbel".source = mkOutOfStoreSymlink "${dotfile.data}/user-places.xbel";

    # see https://bugs.kde.org/show_bug.cgi?id=414971 and https://bugs.kde.org/show_bug.cgi?id=227793
    # fix ksystemlog on wayland (commented X-KDE-SubstituteUID=true)
    "applications/org.kde.ksystemlog.desktop".text = ''
      #!/usr/bin/env xdg-open
      [Desktop Entry]
      Type=Application
      Exec=ksystemlog -qwindowtitle %c
      Icon=utilities-log-viewer
      Categories=Qt;KDE;System;Monitor;
      X-DocPath=ksystemlog/index.html
      # X-KDE-SubstituteUID=true
      Keywords=log;logfile;system messages;system log;kernel log;authentication log;X.org log;journald log;services logs;Event Viewer;eventvwr;eventlog;
      Keywords[zh_CN]=log;logfile;system messages;system log;kernel log;authentication log;X.org log;journald log;services logs;Event Viewer;eventvwr;eventlog;日志;日志文件;系统消息;系统日志;内核日志;身份验证日志;X.org 日志;journald 日志;事件查看器;事件日志;rizhi;rizhiwenjian;xitongxiaoxi;xitongrizhi;neiherizhi;shenfenyanzhengrizhi;shijianchakanqi;shijianrizhi;
      Name=KSystemLog
      Name[zh_CN]=KSystemLog 系统日志
      Comment=System log viewer tool
      Comment[zh_CN]=系统日志查看工具
      GenericName=System Log Viewer
      GenericName[zh_CN]=系统日志查看器
    '';
  };
}

