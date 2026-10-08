{ ... }:

{
  # Phone integration (firewall ports + kdeconnect daemon). Desktop-agnostic;
  # the front-end under niri is DMS's Phone Connect plugin. Kept out of kde.nix
  # so it survives the Plasma removal.
  programs.kdeconnect.enable = true;
}
