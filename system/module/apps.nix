{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    #--------------cmdline tools--------------#
    file
    neofetch
    btop
    tealdeer
    tree
    pwgen
    # busybox
    gh # github cli

    # AI
    ollama

    #---------------gui tools--------------#
    # multimedia
    mpv
    # yesplaymusic
    youtube-music
    aseprite
    gimp
    haruna

    # IM
    telegram-desktop
    element-desktop
    discord

    # game
    glaumarPkgs.qrookie
    ludusavi
    # nexusmods-app-unfree

    # bittorrent
    qbittorrent

    # office
    calibre
    libreoffice-qt6-fresh
    # wpsoffice 
    anki
    logseq
    joplin-desktop
    vnote

    # bangumi
    # kazumi
    chromium
    brave

    # other
    xorg.xkill

    rclone
  ];

  services.syncthing.enable = true;
}

 