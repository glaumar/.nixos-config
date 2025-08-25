{ ... }:

{
  
  imports = [
    ../system/flatpak.nix
  ];

  services.flatpak.packages = [
    { appId = "io.github.Predidit.Kazumi"; origin = "flathub"; }
  ];
}

 