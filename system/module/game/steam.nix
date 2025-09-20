{ pkgs, ... }:

{

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
  

  # programs.alvr = {
  #   enable = true;
  #   openFirewall = true;
  # };

# Notes:
# use follow launch option to fix steamvr :
#   WAYLAND_DISPLAY='' ~/.local/share/Steam/steamapps/common/SteamVR/bin/vrmonitor.sh %command%


}
