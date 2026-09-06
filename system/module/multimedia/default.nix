{ pkgs, ... }:

{
  imports = [
    ./kazumi.nix
    ./suwayomi.nix
    ./live_captions.nix
    ./mpv.nix
    ./speechd.nix
  ];

  environment.systemPackages = with pkgs; [
    haruna
    splayer
    qbittorrent
  ];
}
