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

    rar
    # unzip
    # unar
    # convmv

    # AI
    ollama
    jan

    #---------------gui tools--------------#
    # multimedia
    mpv
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


    # office
    calibre
    mcomix
    readest
    libreoffice-qt6-fresh
    # wpsoffice 
    anki
    obsidian

    # bangumi
    # kazumi
    chromium
    # brave
    # librewolf

    # downloader
    yt-dlp
    qbittorrent
    motrix

    # other
    xorg.xkill

    rclone

  ];

  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
  };
}

 