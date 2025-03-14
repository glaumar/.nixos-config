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
    android-tools

    desktop-file-utils
    appstream
    just
    direnv

    # vim ide
    lunarvim
    wl-clipboard-rs

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
    syncthing

    # other
    xorg.xkill

    kdePackages.kget
    anki

    rclone
  ];

}

 