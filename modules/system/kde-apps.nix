{
  lib,
  pkgs,
  config,
  ...
}:

{
  # Standalone KDE/Qt apps and integrations kept after removing Plasma. They do
  # not depend on the Plasma desktop, only on KDE Frameworks/Qt.
  environment.systemPackages =
    with pkgs.kdePackages;
    [
      dolphin # file manager
      ark # archive manager
      kio-extras # SMB/SFTP/thumbnail KIO workers Dolphin relies on
      (pkgs.rar)
      (pkgs.p7zip)
    ]
    ++ lib.optionals config.services.samba.enable [
      kdenetwork-filesharing
    ]
    # The Plasma Vaults in ~/.local/share/plasma-vault are gocryptfs containers.
    # Without this, removing Plasma Vault would leave them unmountable
    # (`gocryptfs <cipher> <mount>`). Drop this line if the vaults were abandoned.
    ++ [ pkgs.gocryptfs ];
}
