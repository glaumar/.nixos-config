{ pkgs, ... }:

{

  imports = [
    ./peripheral.nix
    ./waydroid.nix
  ];

  environment.systemPackages = with pkgs; [
    telegram-desktop
    element-desktop
    discord

  ];
}

 