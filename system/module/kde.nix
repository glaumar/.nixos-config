{ lib, pkgs, ... }:

{
  # Enable the KDE Plasma Desktop Environment.(wayland only)
  services.displayManager.defaultSession = lib.mkDefault "plasma";
  services.displayManager.sddm.enable = lib.mkDefault  true;
  services.displayManager.sddm.wayland.enable = lib.mkDefault true;
  services.desktopManager.plasma6.enable = lib.mkDefault true;

  environment.systemPackages = with pkgs.kdePackages; [
    kate
    yakuake

    # Using the KDE Wallet to store ssh key passphrases
    ksshaskpass

    # system tools
    partitionmanager
    
    # dev
    plasma-sdk
  ];

  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
  };

  environment.plasma6.excludePackages = with pkgs; [
    kdePackages.elisa
  ];

  environment.variables = {
    # Using the KDE Wallet to store ssh key passphrases
    # https://wiki.archlinux.org/title/KDE_Wallet#Using_the_KDE_Wallet_to_store_ssh_key_passphrases
    SSH_ASKPASS = lib.mkForce "${pkgs.kdePackages.ksshaskpass.out}/bin/ksshaskpass";
    SSH_ASKPASS_REQUIRE = "prefer";
  };

  programs.kdeconnect = {
    enable = lib.mkDefault true;
  };

  # fcitx5
  i18n.inputMethod = {
    type = "fcitx5";
    enable = lib.mkDefault true;
    fcitx5.plasma6Support = lib.mkDefault true;
    fcitx5.waylandFrontend = lib.mkDefault true;
    fcitx5.addons = with pkgs; [
      kdePackages.fcitx5-chinese-addons
      kdePackages.fcitx5-with-addons
      fcitx5-anthy
    ];
  };

  # enable wayland for electron
  environment.sessionVariables.NIXOS_OZONE_WL = lib.mkDefault "1";
}
