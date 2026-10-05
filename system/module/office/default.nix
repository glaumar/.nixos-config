{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    calibre
    # mcomix
    libreoffice-qt
    libreoffice
    anki
    obsidian
    readest
    logseq
    nextcloud-client
    zotero
    super-productivity
    thunderbird
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
