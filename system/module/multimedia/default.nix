{ pkgs, ... }:

{
  imports = [
    ./kazumi.nix
    ./suwayomi.nix
    ./live_captions.nix
    ./mpv.nix
  ];

  environment.systemPackages = with pkgs; [
    haruna
    splayer
    qbittorrent
  ];
}
