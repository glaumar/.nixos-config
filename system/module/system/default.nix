{ ... }:

{
  imports = [
    ./boot.nix
    ./fonts.nix
    ./gc.nix
    ./locale.nix
    ./locate.nix
    ./secrets.nix
    ./user.nix
    ./fwupd.nix

    ./kde.nix
    ./base_packages.nix
    ./flatpak.nix
    ./firefox.nix
    ./syncthing.nix
    ./samba.nix
  ];
}
