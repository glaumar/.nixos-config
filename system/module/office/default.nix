{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    calibre
    # mcomix
    libreoffice-qt6-fresh
    anki-bin
    obsidian
    # readest
  ];

  imports = [
    ../system/flatpak.nix
  ];

  services.flatpak.packages = [
    { appId = "com.bilingify.readest"; origin = "flathub"; }
  ];
}

 