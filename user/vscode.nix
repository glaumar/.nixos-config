{ ... }:

{
  programs.vscode.enable = true;
  # fix fcitx5
  xdg.dataFile."applications/code.desktop".text = ''
    [Desktop Entry]
    Actions=new-empty-window
    Categories=Utility;TextEditor;Development;IDE
    Comment=Code Editing. Redefined.
    Exec=code --enable-features=UseOzonePlatform --enable-wayland-ime %F
    GenericName=Text Editor
    Icon=vscode
    Keywords=vscode
    MimeType=text/plain;inode/directory
    Name=Visual Studio Code
    StartupNotify=true
    StartupWMClass=Code
    Type=Application
    Version=1.4

    [Desktop Action new-empty-window]
    Exec=code --enable-features=UseOzonePlatform --enable-wayland-ime --new-window %F
    Icon=vscode
    Name=New Empty Window
  '';

  xdg.dataFile."applications/code-url-handler.desktop".text = ''
    [Desktop Entry]
    Categories=Utility;TextEditor;Development;IDE
    Comment=Code Editing. Redefined.
    Exec=code --enable-features=UseOzonePlatform --enable-wayland-ime --open-url %U
    GenericName=Text Editor
    Icon=vscode
    Keywords=vscode
    MimeType=x-scheme-handler/vscode
    Name=Visual Studio Code - URL Handler
    NoDisplay=true
    StartupNotify=true
    Type=Application
    Version=1.4
  '';

}