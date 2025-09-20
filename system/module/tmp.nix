{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    rclone
    chromium
    # karlyriceditor
    # python313Full
    # python313Packages.openai-whisper
    # python313Packages.srt
    # python313Packages.requests
    # python313Packages.torch
    komikku
    kazumi
    rquickshare
    stellarium
    proton-pass
  ];

  programs.localsend = {
    enable = true;
    openFirewall = true;
  };

  imports = [
    ./system/flatpak.nix
  ];

  services.flatpak.packages = [
    # { appId = "io.otsaloma.gaupol"; origin = "flathub"; }
  ];


}
