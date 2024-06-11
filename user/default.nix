{ config, pkgs, ... }:

{
  home.username = "glaumar";
  home.homeDirectory = "/home/glaumar";

  home.packages = with pkgs;[
    neofetch
    btop
    xorg.xkill

    # nix
    nil # nix lsp
    nixpkgs-fmt # nix formate

  ];

  # git
  programs.git = {
    enable = true;
    userName = "glaumar";
    userEmail = "git@geekgo.tech";
  };

  programs.fish.enable = true;

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

  # dotfile
  xdg.configFile =
    let
      conf_home = "${config.home.homeDirectory}/.nixos-config/dotfiles/.config";
    in
    with config.lib.file;  {
      # xdg
      "user-dirs.dirs".source = mkOutOfStoreSymlink "${conf_home}/user-dirs.dirs";
      "user-dirs.locale".source = mkOutOfStoreSymlink "${conf_home}/user-dirs.locale";
      "autostart".source = mkOutOfStoreSymlink "${conf_home}/autostart";
      "fontconfig/fonts.conf".source = mkOutOfStoreSymlink "${conf_home}/fontconfig/fonts.conf";
      "mimeapps.list".source = mkOutOfStoreSymlink "${conf_home}/mimeapps.list";

      # kde
      "kdedefaults".source = mkOutOfStoreSymlink "${conf_home}/kdedefaults";
      "kwinrc".source = mkOutOfStoreSymlink "${conf_home}/kwinrc";
      "kglobalshortcutsrc".source = mkOutOfStoreSymlink "${conf_home}/kglobalshortcutsrc";
      "ktimezonedrc".source = mkOutOfStoreSymlink "${conf_home}/ktimezonedrc";
      "kded5rc".source = mkOutOfStoreSymlink "${conf_home}/kded5rc";
      "kded6rc".source = mkOutOfStoreSymlink "${conf_home}/kded6rc";
      "kdeglobals".source = mkOutOfStoreSymlink "${conf_home}/kdeglobals";
      "kxkbrc".source = mkOutOfStoreSymlink "${conf_home}/kxkbrc";
      "kconf_updaterc".source = mkOutOfStoreSymlink "${conf_home}/kconf_updaterc";
      "kcminputrc".source = mkOutOfStoreSymlink "${conf_home}/kcminputrc";
      "kcmfonts".source = mkOutOfStoreSymlink "${conf_home}/kcmfonts";
      "powermanagementprofilesrc".source = mkOutOfStoreSymlink "${conf_home}/powermanagementprofilesrc";
      "systemsettingsrc".source = mkOutOfStoreSymlink "${conf_home}/systemsettingsrc";
      "kinfocenterrc".source = mkOutOfStoreSymlink "${conf_home}/kinfocenterrc";
      "ksmserverrc".source = mkOutOfStoreSymlink "${conf_home}/ksmserverrc";
      "baloofilerc".source = mkOutOfStoreSymlink "${conf_home}/baloofilerc";
      "baloofileinformationrc".source = mkOutOfStoreSymlink "${conf_home}/baloofileinformationrc";
      "kactivitymanagerd-statsrc".source = mkOutOfStoreSymlink "${conf_home}/kactivitymanagerd-statsrc";
      "kactivitymanagerdrc".source = mkOutOfStoreSymlink "${conf_home}/kactivitymanagerdrc";
      "plasmashellrc".source = mkOutOfStoreSymlink "${conf_home}/plasmashellrc";
      "plasmanotifyrc".source = mkOutOfStoreSymlink "${conf_home}/plasmanotifyrc";
      "plasma-localerc".source = mkOutOfStoreSymlink "${conf_home}/plasma-localerc";
      "plasma-workspace".source = mkOutOfStoreSymlink "${conf_home}/plasma-workspace";
      "plasma-org.kde.plasma.desktop-appletsrc".source = mkOutOfStoreSymlink "${conf_home}/plasma-org.kde.plasma.desktop-appletsrc";

      # gtk
      "gtk-3.0".source = mkOutOfStoreSymlink "${conf_home}/gtk-3.0";
      "gtk-4.0".source = mkOutOfStoreSymlink "${conf_home}/gtk-4.0";

      # kde app
      "konsolerc".source = mkOutOfStoreSymlink "${conf_home}/konsolerc";
      "dolphinrc".source = mkOutOfStoreSymlink "${conf_home}/dolphinrc";
      "yakuakerc".source = mkOutOfStoreSymlink "${conf_home}/yakuakerc";
      "klipperrc".source = mkOutOfStoreSymlink "${conf_home}/klipperrc";
      "systemmonitorrc".source = mkOutOfStoreSymlink "${conf_home}/systemmonitorrc";
      "spectaclerc".source = mkOutOfStoreSymlink "${conf_home}/spectaclerc";
      "katerc".source = mkOutOfStoreSymlink "${conf_home}/katerc";
      "gwenviewrc".source = mkOutOfStoreSymlink "${conf_home}/gwenviewrc";

      # other app
      "fcitx5".source = mkOutOfStoreSymlink "${conf_home}/fcitx5";
      "neofetch".source = mkOutOfStoreSymlink "${conf_home}/neofetch";
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
