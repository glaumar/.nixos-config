{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    xorg.xkill
    gh # github cli
    file
    neofetch
    btop
    tealdeer
    tree
    pwgen
  ];
}

 