{ pkgs, ... }:

{

  imports = [
    ./kazumi.nix
    ./suwayomi.nix
    ./live_captions.nix
  ];

  environment.systemPackages = with pkgs; [
    mpv
    haruna
    # youtube-music
    splayer
    qbittorrent
  ];
}

 