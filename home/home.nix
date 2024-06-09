{ config, pkgs, ... }:

{
  home.username = "glaumar";
  home.homeDirectory = "/home/glaumar";

  home.packages = with pkgs;[
    neofetch
    nnn # terminal file manager

    # utils
    ripgrep # recursively searches directories for a regex pattern
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring
  ];

  # git
  programs.git = {
    enable = true;
    userName = "glaumar";
    userEmail = "git@geekgo.tech";
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
