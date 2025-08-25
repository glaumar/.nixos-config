{ pkgs, ... }:

{

  imports = [
    ./speech_note.nix
  ];

  environment.systemPackages = with pkgs; [
    mpv
    yt-dlp
    aseprite
    gimp
    kdePackages.kdenlive
    handbrake
    easytag
    puddletag
  ];

}

 