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
      ../module/firefox.nix
      ../module/kde.nix
      ../module/flatpak.nix
      ../module/piper.nix
      ../module/daed.nix

      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  networking.hostName = "SteamDeck";

  services.displayManager.sddm.enable = lib.mkForce false;
  services.displayManager.defaultSession = lib.mkForce "gamescope";

  programs.steam = {
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
    fontPackages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
    ];
    remotePlay.openFirewall = true;
  };

  # all jovian options: 
  #   https://jovian-experiments.github.io/Jovian-NixOS/options.html
  jovian = {
    steam = {
      enable = true;
      autoStart = true;
      desktopSession = "plasma";
      user = "glaumar";
    };

    devices.steamdeck = {
      enable = true;
      autoUpdate = true;
    };

    # decky-loader = {
    #   enable = true;
    #   user = "glaumar";
    # extraPackages = with pkgs; [ python3 ];
    # };
  };

  environment.sessionVariables = {
    STEAM_FORCE_DESKTOPUI_SCALING = "1.5";
  };

  # environment.systemPackages = with pkgs; [

  #   # TODO: 
  #   #   sgdboop
  #   # see https://github.com/NixOS/nixpkgs/pull/269369
  # ];

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
    allowedTCPPorts = [
      8384 # syncthing webui
    ];
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
