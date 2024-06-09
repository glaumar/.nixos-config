{ config, pkgs, ... }:

{
  home.username = "glaumar";
  home.homeDirectory = "/home/glaumar";

  home.packages = with pkgs;[
    neofetch
    btop
  ];

  # git
  programs.git = {
    enable = true;
    userName = "glaumar";
    userEmail = "git@geekgo.tech";
  };

  # firefox.
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
  };

  # fcitx5
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-chinese-addons
      fcitx5-anthy
      fcitx5-with-addons
    ];
  };

  # vscode
  programs.vscode.enable = true;

  # kdeconnect
  services.kdeconnect = {
    enable = true;
    package = pkgs.kdePackages.kdeconnect-kde;
    indicator = true;
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
