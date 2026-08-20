{ config, dotfile, ... }:

{
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
    "klipperrc".source = mkOutOfStoreSymlink "${dotfile.conf}/klipperrc";
    "krunnerrc".source = mkOutOfStoreSymlink "${dotfile.conf}/krunnerrc";

    # shortcuts
    "kglobalshortcutsrc".source = mkOutOfStoreSymlink "${dotfile.conf}/kglobalshortcutsrc";
    
    # window rule
    "kwinrulesrc".source = mkOutOfStoreSymlink "${dotfile.conf}/kwinrulesrc";

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

