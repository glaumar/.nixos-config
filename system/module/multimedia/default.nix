{ pkgs, ... }:

{

  imports = [
    ./kazumi.nix
  ];

  environment.systemPackages = with pkgs; [
    mpv
    haruna
    youtube-music
    splayer
    qbittorrent
  ];
}

 