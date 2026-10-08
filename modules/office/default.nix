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
    # zotero
    super-productivity
    thunderbird
  ];
}
