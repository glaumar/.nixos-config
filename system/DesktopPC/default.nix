# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{pkgs, ... }:
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
      ../module/peripheral.nix
      ../module/daed.nix
      ../module/steam.nix
      ../module/locate.nix
      ../module/distrobox.nix
      # ../module/nextcloud.nix

      # the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  networking.hostName = "DesktopPC";

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
