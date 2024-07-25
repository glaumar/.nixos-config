{ pkgs, config, ... }:

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
  xdg.configFile =
    let
      conf = "${config.home.homeDirectory}/.nixos-config/dotfiles/.config";
    in
    with config.lib.file;  {
      "aseprite/aseprite.ini".source = mkOutOfStoreSymlink "${conf}/aseprite/aseprite.ini";
    };

}
