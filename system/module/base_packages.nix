{ lib, pkgs, ... }:

{
  # flakes and new nix command
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = lib.mkDefault true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    git
    wget
    curl
  ];

  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
  };

  programs.vim = {
    enable = true;
    defaultEditor = true;
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
  ];
}