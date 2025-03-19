{ lib, config, dotfile, ... }:

{
  xdg.configFile = with config.lib.file;  {
    "tealdeer/config.toml".source = mkOutOfStoreSymlink "${dotfile.conf}/tealdeer/config.toml";
    "lvim".source = mkOutOfStoreSymlink "${dotfile.conf}/lvim";
    "aseprite/aseprite.ini".source = mkOutOfStoreSymlink "${dotfile.conf}/aseprite/aseprite.ini";
    "qBittorrent".source = mkOutOfStoreSymlink "${dotfile.conf}/qBittorrent";
    "YouTube Music".source = mkOutOfStoreSymlink "${dotfile.conf}/YouTube Music";
    "nvim".source = mkOutOfStoreSymlink "${dotfile.conf}/nvim";
    "godot".source = mkOutOfStoreSymlink "${dotfile.conf}/godot";
    "wireshark".source = mkOutOfStoreSymlink "${dotfile.conf}/wireshark";
  };

  # git
  home.file.".gitconfig".source = config.lib.file.mkOutOfStoreSymlink "${dotfile.home}/.gitconfig";

  # Telegram download folder
  home.file."Downloads/Telegram Desktop/.directory".source = config.lib.file.mkOutOfStoreSymlink "${dotfile.home}/Downloads/Telegram Desktop/.directory";

  # fix flatpak fonts
  home.activation.link_font_dir = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    #!/usr/bin/env bash
    if [ ! -L ~/.local/share/fonts ];then
      run ln -s /run/current-system/sw/share/X11/fonts ~/.local/share/fonts
    fi
  '';

  # xdg.dataFile."applications/nexusmods-app.desktop".text = ''
  #   [Desktop Entry]
  #   Name=NexusMods.App
  #   Terminal=false
  #   Type=Application
  #   Exec=NexusMods.App
  # '';
  # xdg.dataFile."applications/nexusmods-app-nxm-handler.desktop".text = ''
  #   [Desktop Entry]
  #   Name=NexusMods.App NXM Handler
  #   Terminal=false
  #   Type=Application
  #   Exec=NexusMods.App protocol-invoke --url %u
  #   MimeType=x-scheme-handler/nxm
  #   NoDisplay=true
  # '';

  # fix fcitx5
  # xdg.dataFile."applications/code.desktop".text = ''
  #   [Desktop Entry]
  #   Actions=new-empty-window
  #   Categories=Utility;TextEditor;Development;IDE
  #   Comment=Code Editing. Redefined.
  #   Exec=code --enable-features=UseOzonePlatform --enable-wayland-ime -n %F
  #   GenericName=Text Editor
  #   Icon=vscode
  #   Keywords=vscode
  #   MimeType=text/plain;inode/directory
  #   Name=Visual Studio Code
  #   StartupNotify=true
  #   StartupWMClass=code
  #   Type=Application
  #   Version=1.4

  #   [Desktop Action new-empty-window]
  #   Exec=code %F --enable-features=UseOzonePlatform --enable-wayland-ime --new-window
  #   Icon=vscode
  #   Name=New Empty Window
  # '';

  # xdg.dataFile."applications/code-url-handler.desktop".text = ''
  #   [Desktop Entry]
  #   Categories=Utility;TextEditor;Development;IDE
  #   Comment=Code Editing. Redefined.
  #   Exec=code --enable-features=UseOzonePlatform --enable-wayland-ime --open-url %U
  #   GenericName=Text Editor
  #   Icon=vscode
  #   Keywords=vscode
  #   MimeType=x-scheme-handler/vscode
  #   Name=Visual Studio Code - URL Handler
  #   NoDisplay=true
  #   StartupNotify=true
  #   Type=Application
  #   Version=1.4
  # ''
}
