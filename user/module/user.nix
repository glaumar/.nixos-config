{ config, dotfile, ... }:

{
  home.username = "glaumar";
  home.homeDirectory = "/home/glaumar";
  # set avatar. TODO: use https://github.com/NixOS/nixpkgs/issues/163080 in the future
  home.file.".face.icon".source = config.lib.file.mkOutOfStoreSymlink "${dotfile.home}/avatar.png";

  xdg.configFile = with config.lib.file;  {
    # xdg
    "user-dirs.dirs".source = mkOutOfStoreSymlink "${dotfile.conf}/user-dirs.dirs";
    "user-dirs.locale".source = mkOutOfStoreSymlink "${dotfile.conf}/user-dirs.locale";
    "fontconfig/fonts.conf".source = mkOutOfStoreSymlink "${dotfile.conf}/fontconfig/fonts.conf";
    "mimeapps.list".source = mkOutOfStoreSymlink "${dotfile.conf}/mimeapps.list";
    "gtk-3.0/bookmarks".source = mkOutOfStoreSymlink "${dotfile.conf}/gtk-3.0/bookmarks";
  };
}
