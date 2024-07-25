# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ lib, pkgs, ... }:

{
  imports =
    [
      ../module/boot.nix
      ../module/base_packages.nix
      ../module/locale.nix
      ../module/gc.nix
      ../module/user.nix
      ../module/kde.nix

      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  networking.hostName = "SteamDeck";

  services.displayManager.sddm.enable = lib.mkForce false;
  services.displayManager.defaultSession = lib.mkForce "gamescope";

  programs.steam.extraCompatPackages = [ pkgs.proton-ge-bin ];
  jovian = {
    steam = {
      enable = true;
      autoStart = true;
      desktopSession = "plasma";
      user = "glaumar";
    };

    devices.steamdeck = {
      enable = true;
    };
  };

  environment.sessionVariables = {
   STEAM_FORCE_DESKTOPUI_SCALING = "1.5";
  };

  # List services that you want to enable:

  # daed - dae with a web dashboard
  services.daed = {
    enable = true;

    # allow to access the web dashboard from other devices
    listen = "0.0.0.0:2023";
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
