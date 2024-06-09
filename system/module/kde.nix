{ config, pkgs, ... }:

{
  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.defaultSession = "plasma";
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  environment.systemPackages = with pkgs.kdePackages; [
    kate
  ];
}

