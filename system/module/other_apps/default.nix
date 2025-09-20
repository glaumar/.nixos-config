{ pkgs, ... }:

{

  imports = [
    ./peripheral.nix
    ./waydroid.nix
    ./hardware.nix
  ];

  environment.systemPackages = with pkgs; [
    telegram-desktop
    element-desktop
    discord

  ];
}

 