{ pkgs, config, lib, dotfile, ... }:

{
  home.packages = with pkgs;[
    # multimedia
    mpv
    # yesplaymusic
    youtube-music
    aseprite
    gimp
    haruna

    # IM
    telegram-desktop
    element-desktop
    discord

    # game
    glaumarPkgs.qrookie
    ludusavi

    # bittorrent
    qbittorrent

    # office
    calibre
    libreoffice-qt6-fresh
    # wpsoffice 

    # via

    # Microsoft fonts
    corefonts
    vistafonts
    vistafonts-cht
    vistafonts-chs

    # browser
    # firefox
    # chromium
    tor-browser

    #
    # proton-pass

    # other
    xorg.xkill
  ];

  services.syncthing = {
    enable = true;
    # tray.enable = true;
  };

  programs.chromium = {
    enable = true;
    commandLineArgs = [
      "--enable-features=UseOzonePlatform"
      "--enable-wayland-ime"
    ];
  };

  # dotfile
  xdg.configFile = with config.lib.file;  {
    "aseprite/aseprite.ini".source = mkOutOfStoreSymlink "${dotfile.conf}/aseprite/aseprite.ini";
    "qBittorrent".source = mkOutOfStoreSymlink "${dotfile.conf}/qBittorrent";
    "YouTube Music".source = mkOutOfStoreSymlink "${dotfile.conf}/YouTube Music";
  };

  fonts.fontconfig = {
    enable = true;
    defaultFonts.sansSerif = [
      "Noto Sans"
      # "Microsoft YaHei"
      "Noto Sans CJK SC"
      "Noto Sans CJK TC"
      "Noto Sans CJK JP"
      "Noto Sans CJK KR"
      "Noto Color Emoji"
      # "Noto Emoji"
    ];

    defaultFonts.serif = [
      "Noto Serif"
      "Noto Serif CJK SC"
      "Noto Serif CJK TC"
      "Noto Serif CJK JP"
      "Noto Serif CJK KR"
      "Noto Color Emoji"
      "Noto Emoji"
    ];

    defaultFonts.monospace = [
      "Noto Sans Mono"
      # "Hack"
      "Noto Sans Mono CJK SC"
      "Noto Sans Mono CJK TC"
      "Noto Sans Mono CJK HK"
      "Noto Sans Mono CJK JP"
      "Noto Sans Mono CJK KR"
      "Noto Color Emoji"
      "Noto Emoji"
    ];

    defaultFonts.emoji = [
      "Noto Color Emoji"
      "Noto Emoji"
    ];
  };


  # flatpak apps can not read symbolic link, so we need to copy the file
  home.activation.cp_fontconfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    #!/usr/bin/env bash
    run mkdir -p ${config.xdg.configHome}/fontconfig/
    run cp -rfL ${dotfile.conf}/fontconfig/fonts.conf ${config.xdg.configHome}/fontconfig/fonts.conf
  '';

}
