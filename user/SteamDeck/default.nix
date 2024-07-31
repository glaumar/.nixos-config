{ config, pkgs, lib, ... }:

let
  dotfile = rec {
    project_root = "${config.home.homeDirectory}/.nixos-config";
    home = "${project_root}/dotfiles";
    conf = "${home}/.config";
    data = "${home}/.local/share";
  };
in
{
  imports =
    [
      (import ../module/user.nix { inherit config dotfile; })
      (import ../module/key_generate.nix { inherit pkgs lib; })
      (import ../module/plasma.nix { inherit config dotfile pkgs; })
      (import ../module/vscode.nix { inherit config pkgs dotfile; })
      (import ../module/cmd_tools.nix { inherit config pkgs dotfile; })
      (import ../module/gui_apps.nix { inherit config pkgs lib dotfile; })
      # ../module/nexusmods_app.nix
    ];

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
