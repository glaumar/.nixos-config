{ pkgs, config, dotfile, ... }:

{
  home.packages = with pkgs;[
    mpv
    telegram-desktop
    glaumarPkgs.qrookie
    calibre
    libreoffice-qt6-fresh
    # wpsoffice 
    aseprite
    gimp
    haruna

    # keyboard
    via

    # Microsoft fonts
    corefonts
    vistafonts
    vistafonts-cht
    vistafonts-chs
  ];

  services.syncthing = {
    enable = true;
    # tray.enable = true;
  };

  # dotfile
  xdg.configFile = with config.lib.file;  {
    "aseprite/aseprite.ini".source = mkOutOfStoreSymlink "${dotfile.conf}/aseprite/aseprite.ini";
  };

  fonts.fontconfig = {
    enable = true;
    defaultFonts.sansSerif = [
      "Noto Sans"
      "Noto Sans CJK SC"
      "Microsoft YaHei"
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
      # "Noto Emoji"
    ];

    defaultFonts.monospace = [
      "Noto Sans Mono"
      "Hack"
      "FiraCode Nerd Font Mono"
      "Noto Sans Mono CJK SC"
      "Noto Sans Mono CJK TC"
      "Noto Sans Mono CJK HK"
      "Noto Sans Mono CJK JP"
      "Noto Sans Mono CJK KR"
      "Noto Color Emoji"
      # "Noto Emoji"
    ];
    
    defaultFonts.emoji = [
      "Noto Color Emoji"
      # "Noto Emoji"
    ];
  };

}
