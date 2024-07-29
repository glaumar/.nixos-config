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

    # keyboard
    via
  ];

  services.syncthing = {
    enable = true;
    # tray.enable = true;
  };

  # dotfile
  xdg.configFile = with config.lib.file;  {
    "aseprite/aseprite.ini".source = mkOutOfStoreSymlink "${dotfile.conf}/aseprite/aseprite.ini";
  };

}
