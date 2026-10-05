{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    rclone
    # proxypin
    chromium
    # rquickshare
    stellarium
    # nix-du
    # animeko
    # mpvScripts.thumbnail
    dbgate
    firefox
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-39.8.10"
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
