{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rclone
    stellarium
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-39.8.10"
  ];
}
