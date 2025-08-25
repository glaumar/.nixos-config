{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    rclone
    chromium

    kdePackages.elisa
  ];
}
