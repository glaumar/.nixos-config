{ pkgs, ... }:

{
  # Qt platform theming, matching DMS: Qt6 uses DMS's own qtengine (dynamic
  # Material theming + icon theme), legacy Qt5 apps fall back to qt5ct.
  # qt.enable wires QT_PLUGIN_PATH so the qtengine plugin is discoverable.
  qt.enable = true;

  environment.systemPackages = with pkgs; [
    qtengine # DMS Qt6 platform theme (KDE Frameworks based)
    libsForQt5.qt5ct # legacy Qt5 apps
  ];

  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt5ct"; # Qt5
    QT_QPA_PLATFORMTHEME_QT6 = "qtengine"; # Qt6
  };
}
