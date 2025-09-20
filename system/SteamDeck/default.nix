# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ lib, pkgs, ... }:

{
  imports =
    [
      ../module/system/boot.nix
      ../module/system/base_packages.nix
      ../module/system/locale.nix
      ../module/system/gc.nix
      ../module/system/user.nix
      ../module/system/kde.nix
      ../module/system/firefox.nix
      ../module/system/fonts.nix
      ../module/system/flatpak.nix
      ../module/system/syncthing.nix

      ../module/network/default.nix

      ../module/game/steam.nix
      ../module/game/jovian.nix

      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  networking.hostName = "SteamDeck";
  boot.loader.systemd-boot.configurationLimit = lib.mkForce 3;

  services.displayManager.sddm.enable = lib.mkForce false;
  services.displayManager.defaultSession = lib.mkForce "gamescope";

  environment.sessionVariables = {
    STEAM_FORCE_DESKTOPUI_SCALING = "1.5";
  };

  environment.systemPackages = with pkgs; [

    mpv
    ludusavi

    # IDE
    vscode
    # nix
    nil # nix lsp
    nixpkgs-fmt # nix formatter

    just
    direnv

  ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    openFirewall = true;
  };

  networking.nftables.enable = true;
  networking.firewall = {
    enable = true;
    allowPing = true;
    allowedTCPPorts = [ ];
    allowedUDPPorts = [ ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
