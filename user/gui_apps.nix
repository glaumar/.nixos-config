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
  ];

  services.syncthing = {
    enable = true;
    # tray.enable = true;
  };

  # dotfile
  xdg.configFile =
    let
      conf_home = "${config.home.homeDirectory}/.nixos-config/dotfiles/.config";
    in
    with config.lib.file;  {
      "aseprite/aseprite.ini".source = mkOutOfStoreSymlink "${conf_home}/aseprite/aseprite.ini";
    };

}
