{ pkgs, ... }:

{

  imports = [
    ./kazumi.nix
    ./suwayomi.nix
  ];

  environment.systemPackages = with pkgs; [
    mpv
    haruna
    youtube-music
    splayer
    qbittorrent
  ];
}

 