{ pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    xkill
    gh # github cli
    file
    # neofetch
    fastfetch
    btop
    tealdeer
    tree
    pwgen
    jq
    
    # hardware
    dmidecode
  ];
}

 