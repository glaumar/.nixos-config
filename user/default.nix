{ config, pkgs, ... }:


{
  imports =
    [
      ./plasma.nix
      ./vscode.nix
      ./cmd_tools.nix
      ./gui_apps.nix
    ];

  home.username = "glaumar";
  home.homeDirectory = "/home/glaumar";

  home.packages = with pkgs;[
    # nix
    nil # nix lsp
    nixpkgs-fmt # nix formate
  ];
  
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
