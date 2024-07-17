{ config, ... }:

{
  programs.plasma = {
    enable = true;
    workspace = {
      clickItemTo = "open";
      lookAndFeel = "org.kde.breezedark.desktop";
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

      # kde
      "kglobalshortcutsrc".source = mkOutOfStoreSymlink "${conf_home}/kglobalshortcutsrc";

      # kde app
      "konsolerc".source = mkOutOfStoreSymlink "${conf_home}/konsolerc";
      "yakuakerc".source = mkOutOfStoreSymlink "${conf_home}/yakuakerc";
      "klipperrc".source = mkOutOfStoreSymlink "${conf_home}/klipperrc";
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

