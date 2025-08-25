{ pkgs, ... }:

{

  imports = [
    ../system/flatpak.nix
  ];

  services.flatpak.packages = [
    { appId = "io.github.wivrn.wivrn"; origin = "flathub"; }
  ];

  # environment.systemPackages = with pkgs; [
  #   wivrn
  # ];

  services.avahi.enable = true;
  services.avahi.publish.userServices = true;
  networking.firewall.allowedTCPPorts = [ 9757 ];
  networking.firewall.allowedUDPPorts = [ 9757 ];

}
