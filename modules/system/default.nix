{ ... }:

{
  imports = [
    ./boot.nix
    ./fonts.nix
    ./gc.nix
    ./locale.nix
    ./locate.nix
    ./secrets.nix
    ./dotfiles.nix
    ./user.nix
    ./shell.nix
    ./terminal.nix
    ./yazi.nix
    ./fwupd.nix

    ./input-method.nix
    ./session-env.nix
    ./portals.nix
    ./keyring.nix
    ./kdeconnect.nix
    ./kde-apps.nix
    ./icons.nix
    ./qt.nix

    ./base_packages.nix
    ./flatpak.nix
    ./firefox.nix
    ./syncthing.nix
    ./samba.nix
  ];
}
