{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    #--------------cmdline tools--------------#
    file
    neofetch
    btop
    tealdeer
    tree
    pwgen
    gh # github cli
    xorg.xkill
  ];
}

 