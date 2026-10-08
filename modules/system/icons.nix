{ pkgs, ... }:

{
  # Desktop-agnostic icon and cursor themes, installed system-wide so DMS (and
  # GTK/Qt apps) can select them from Settings -> Appearance. DMS defaults to
  # "System Default"; pick a concrete theme there after switching.
  environment.systemPackages = with pkgs; [
    papirus-icon-theme # Papirus / Papirus-Dark / Papirus-Light
    tela-icon-theme # Tela variants
    adwaita-icon-theme # GNOME fallback (also provides the Adwaita cursor theme)
    sound-theme-freedesktop # the "freedesktop" sound theme referenced by GTK
    bibata-cursors # cursor themes
    kdePackages.breeze-icons # full icon coverage for Dolphin/Qt apps
    kdePackages.breeze # breeze_cursors
  ];
}
