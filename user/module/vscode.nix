{ config, pkgs, dotfile, ... }:

{
  programs.vscode.enable = true;

  home.packages = with pkgs;[
    # nix
    nil # nix lsp
    nixpkgs-fmt # nix formatter

    # lua
    lua-language-server

    lemminx # xml lsp 
    # yaml-language-server

    # cpp
    # ccls # c/c++ lsp
    clang-tools # c/c++ lsp and formatter
    libclang.python # git-clang-format

    # rust
    cargo
    clippy
    rust-analyzer # rust lsp
    rustfmt # rust formatter

    # godot
    godot_4
    godot_4-export-templates

    # npm and nodejs for slidev
    nodePackages.nodejs
  ];

  # fix fcitx5
  xdg.dataFile."applications/code.desktop".text = ''
    [Desktop Entry]
    Actions=new-empty-window
    Categories=Utility;TextEditor;Development;IDE
    Comment=Code Editing. Redefined.
    Exec=code %F --enable-features=UseOzonePlatform --enable-wayland-ime
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
    Exec=code %F --enable-features=UseOzonePlatform --enable-wayland-ime --new-window
    Icon=vscode
    Name=New Empty Window
  '';

  xdg.dataFile."applications/code-url-handler.desktop".text = ''
    [Desktop Entry]
    Categories=Utility;TextEditor;Development;IDE
    Comment=Code Editing. Redefined.
    Exec=code %U --enable-features=UseOzonePlatform --enable-wayland-ime --open-url
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

  xdg.configFile = with config.lib.file;  {
    "nvim".source = mkOutOfStoreSymlink "${dotfile.conf}/nvim";
    "godot".source = mkOutOfStoreSymlink "${dotfile.conf}/godot";
  };

  # for dionmunk.vscode-notes 
  home.file."Notes/.directory".source = config.lib.file.mkOutOfStoreSymlink "${dotfile.home}/Notes/.directory";
}
