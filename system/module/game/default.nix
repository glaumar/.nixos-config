{ pkgs, ... }:

{
  imports = [
    ./steam.nix
    ./wivrn.nix
    ./wayvr.nix
  ];

  environment.systemPackages = with pkgs; [
    # glaumarPkgs.qrookie
    ludusavi
    
    lsfg-vk
    lsfg-vk-ui

    mangohud
    steamguard-cli
  ];

}