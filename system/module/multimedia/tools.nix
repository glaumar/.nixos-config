{ pkgs, ... }:

{

  imports = [
    ./speech_note.nix
    # ../system/flatpak.nix
  ];

  environment.systemPackages = with pkgs; [
    mpv
    yt-dlp
    aseprite
    gimp
    kdePackages.kdenlive
    handbrake
    kid3
    subtitlecomposer
  ];

  # services.flatpak.packages = [
  #   { appId = "org.kde.kdenlive"; origin = "flathub"; }
  # ];
}

 