
{ ... }:

{
  
  imports = [
    ../system/flatpak.nix
  ];

  services.flatpak.packages = [
    { appId = "net.sapples.LiveCaptions"; origin = "flathub"; }
  ];
}

 