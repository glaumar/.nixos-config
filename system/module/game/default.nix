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
    sgdboop
    
    # mangohud
    # steamguard-cli

  ];

}