# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:
{
  imports =
    [
      ../module/tmp.nix

      ../module/system/default.nix
      ../module/network/default.nix
      ../module/multimedia/default.nix
      ../module/multimedia/tools.nix
      ../module/game/default.nix
      ../module/develop/default.nix
      ../module/office/default.nix
      ../module/other_apps/default.nix


      # the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # networking.hostName = "DesktopPC";
  networking.hostName = "NixOS2501";

  # Enable automatic login for the user.
  #   services.displayManager.autoLogin.enable = true;
  #   services.displayManager.autoLogin.user = "glaumar";

  environment.sessionVariables = {
    STEAM_FORCE_DESKTOPUI_SCALING = "2";
  };

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    gparted
  ];



  # List services that you want to enable:

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ 80 ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;
  networking.nftables.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
