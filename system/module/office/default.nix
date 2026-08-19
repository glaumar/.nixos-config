{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    calibre
    # mcomix
    libreoffice-qt6-fresh
    libreoffice-fresh
    anki
    obsidian
    readest
    logseq
    nextcloud-client
    zotero
    super-productivity
  ];

  # imports = [
  #   ../system/flatpak.nix
  # ];

  # services.flatpak.packages = [
  #   {
  #     appId = "com.super_productivity.SuperProductivity";
  #     origin = "flathub";
  #   }
  # ];
}
