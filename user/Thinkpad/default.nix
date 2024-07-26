{ config, pkgs, ... }:

let
  dotfile.conf = "${config.home.homeDirectory}/.nixos-config/dotfiles/.config";
  dotfile.data = "${config.home.homeDirectory}/.nixos-config/dotfiles/.local/share";
in
{
  imports =
    [
      (import ../module/plasma.nix { inherit config dotfile; })
      (import ../module/vscode.nix { inherit config pkgs dotfile; })
      (import ../module/cmd_tools.nix { inherit config pkgs dotfile; })
      # (import ../module/gui_apps.nix { inherit config pkgs dotfile; })
    ];

  home.username = "glaumar";
  home.homeDirectory = "/home/glaumar";

  xdg.configFile = with config.lib.file;  {
    # xdg
    "user-dirs.dirs".source = mkOutOfStoreSymlink "${dotfile.conf}/user-dirs.dirs";
    "user-dirs.locale".source = mkOutOfStoreSymlink "${dotfile.conf}/user-dirs.locale";
    "fontconfig/fonts.conf".source = mkOutOfStoreSymlink "${dotfile.conf}/fontconfig/fonts.conf";
    "mimeapps.list".source = mkOutOfStoreSymlink "${dotfile.conf}/mimeapps.list";
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