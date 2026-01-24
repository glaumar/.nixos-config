{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    rclone
    chromium
    rquickshare
    stellarium
    proton-pass
    remnote
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
