{ lib, pkgs, config, ... }:

{
  imports = [
    ./samba.nix
  ];

  # Enable the KDE Plasma Desktop Environment.(wayland only)
  services.displayManager.defaultSession = lib.mkDefault "plasma";
  services.displayManager.sddm = {
    enable = lib.mkDefault true;
    wayland.enable = true;
    settings = {
      General = {
        InputMethod = "qtvirtualkeyboard";
      };
    };
  };

  services.desktopManager.plasma6.enable = true;

  environment.systemPackages = with pkgs.kdePackages; [
    kate
    yakuake
    discover
    # virtual keyboard for sddm
    qtvirtualkeyboard

    # Using the KDE Wallet to store ssh key passphrases
    ksshaskpass

    plasma-vault
    plasma-browser-integration
    # plasma-firewall
    sddm-kcm

    # dev
    plasma-sdk
    
    # utilities
    partitionmanager
    ksystemlog
    kget
    
    # for ark 
    (pkgs.rar)
    
  ] ++ lib.optionals config.services.flatpak.enable [
    # make flatpak GTK app follow system theme
    (pkgs.xdg-desktop-portal-gtk)
  ] ++ lib.optionals config.services.samba.enable [
    kdenetwork-filesharing
  ];

  # environment.plasma6.excludePackages = with pkgs; [
  #   kdePackages.elisa
  # ];

  environment.variables = {
    # Using the KDE Wallet to store ssh key passphrases
    # https://wiki.archlinux.org/title/KDE_Wallet#Using_the_KDE_Wallet_to_store_ssh_key_passphrases
    SSH_ASKPASS = lib.mkForce "${pkgs.kdePackages.ksshaskpass.out}/bin/ksshaskpass";
    SSH_ASKPASS_REQUIRE = "prefer";
  };

  programs.kdeconnect = {
    enable = true;
  };

  # fcitx5
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      kdePackages.fcitx5-chinese-addons
      kdePackages.fcitx5-with-addons
      fcitx5-anthy
      fcitx5-hangul
      fcitx5-pinyin-minecraft
      fcitx5-pinyin-moegirl
      fcitx5-pinyin-zhwiki
    ];
  };

  environment.sessionVariables = {
    # enable wayland for electron
    NIXOS_OZONE_WL = "1";
  };
}
