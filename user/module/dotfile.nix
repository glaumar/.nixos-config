{ lib, config, dotfile, ... }:

{
  xdg.configFile = with config.lib.file;  {
    "tealdeer/config.toml".source = mkOutOfStoreSymlink "${dotfile.conf}/tealdeer/config.toml";
    "lvim".source = mkOutOfStoreSymlink "${dotfile.conf}/lvim";
    "aseprite/aseprite.ini".source = mkOutOfStoreSymlink "${dotfile.conf}/aseprite/aseprite.ini";
    "qBittorrent".source = mkOutOfStoreSymlink "${dotfile.conf}/qBittorrent";
    "nvim".source = mkOutOfStoreSymlink "${dotfile.conf}/nvim";
    "godot".source = mkOutOfStoreSymlink "${dotfile.conf}/godot";
    "wireshark".source = mkOutOfStoreSymlink "${dotfile.conf}/wireshark";
    "mpv".source = mkOutOfStoreSymlink "${dotfile.conf}/mpv";
    "lsfg-vk".source = mkOutOfStoreSymlink "${dotfile.conf}/lsfg-vk";
  };

  # git
  home.file.".gitconfig".source = config.lib.file.mkOutOfStoreSymlink "${dotfile.home}/.gitconfig";

  # Telegram download folder
  home.file."Downloads/Telegram Desktop/.directory".source = config.lib.file.mkOutOfStoreSymlink "${dotfile.home}/Downloads/Telegram Desktop/.directory";
  
  # firefox download folder
  home.file."Downloads/firefox/.directory".source = config.lib.file.mkOutOfStoreSymlink "${dotfile.home}/Downloads/firefox/.directory";

  # qbittorrent download folder
  home.file."Downloads/qBittorrent/.directory".source = config.lib.file.mkOutOfStoreSymlink "${dotfile.home}/Downloads/qBittorrent/.directory";

  # KDE Connect download folder
  home.file."Downloads/KDE Connect/.directory".source = config.lib.file.mkOutOfStoreSymlink "${dotfile.home}/Downloads/KDE Connect/.directory";
}
