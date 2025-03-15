{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    #--------------cmdline tools--------------#

    # fun tools
    cmatrix
    # cool-retro-term
    hollywood

    file
    neofetch
    btop
    tealdeer
    tree
    pwgen
    busybox
    gh # github cli


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

    tor-browser

    # bangumi
    # kazumi
    chromium

    # other
    xorg.xkill

    anki
    rclone

  ];

  services.syncthing.enable = true;
}

 