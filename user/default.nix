{ config, pkgs, ... }:


{
  imports =
    [
      ./plasma.nix
    ];

  home.username = "glaumar";
  home.homeDirectory = "/home/glaumar";

  home.packages = with pkgs;[
    # cmd tool
    neofetch
    btop
    xorg.xkill
    tealdeer

    # nix
    nil # nix lsp
    nixpkgs-fmt # nix formate

    # app
    telegram-desktop
    glaumar_repo.qrookie
    calibre
    libreoffice-qt6-fresh
    aseprite
  ];

  # git
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "glaumar";
    userEmail = "git@geekgo.tech";
  };
  
  programs.direnv.enable = true;

  # vscode
  programs.vscode.enable = true;
  # TODO: https://discourse.nixos.org/t/partly-overriding-a-desktop-entry/20743
  xdg.desktopEntries.vscode = {
    categories = [ "Utility" "TextEditor" "Development" "IDE" ];
    name = "Visual Studio Code(fcitx5 fix)";
    exec = "code --enable-features=UseOzonePlatform --enable-wayland-ime %F";
    icon = "vscode";
    # Keywords = "vscode";
    genericName = "Text Editor";
    mimeType = [ "text/plain" "inode/directory" ];
    startupNotify = true;
    # startupWmClass = "Code";
    type = "Application";
    # version = 1.4;

    actions."new-empty-window" = {
      exec = "code --new-window %F";
      icon = "vscode";
      name = "New Empty Window";
    };
  };

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
      # xdg
      "user-dirs.dirs".source = mkOutOfStoreSymlink "${conf_home}/user-dirs.dirs";
      "user-dirs.locale".source = mkOutOfStoreSymlink "${conf_home}/user-dirs.locale";
      "fontconfig/fonts.conf".source = mkOutOfStoreSymlink "${conf_home}/fontconfig/fonts.conf";
      "mimeapps.list".source = mkOutOfStoreSymlink "${conf_home}/mimeapps.list";

      # other app
      "tealdeer/config.toml".source = mkOutOfStoreSymlink "${conf_home}/tealdeer/config.toml";
      "aseprite/aseprite.ini".source = mkOutOfStoreSymlink "${conf_home}/aseprite/aseprite.ini";
    };


  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
