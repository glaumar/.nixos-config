{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    calibre
    mcomix
    libreoffice-qt6-fresh
    anki-bin
    obsidian
    jhentai
    readest
  ];
}

 