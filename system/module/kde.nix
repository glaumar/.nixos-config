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

  programs.kdeconnect = {
    enable = true;
  };

  # fcitx5
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.plasma6Support = true;
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      kdePackages.fcitx5-chinese-addons
      kdePackages.fcitx5-with-addons
      fcitx5-anthy
    ];
  };
}

