{ pkgs, config, dotfile, ... }:

{
  home.packages = with pkgs;[
    mpv
    telegram-desktop
    glaumar_repo.qrookie
    calibre
    libreoffice-qt6-fresh
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
