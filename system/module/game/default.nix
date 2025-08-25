{ pkgs, ... }:

{
  imports = [
    ./steam.nix
    ./wivrn.nix
  ];

  environment.systemPackages = with pkgs; [
    glaumarPkgs.qrookie
    ludusavi
  ];

}