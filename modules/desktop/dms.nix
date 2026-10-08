{ pkgs, ... }:

{
  # DankMaterialShell, from nixpkgs. Enabling it installs dms-shell (the `dms`
  # CLI + QML shell), quickshell, matugen and cava, and runs it as a user
  # service bound to graphical-session.target (which niri.service binds to).
  programs.dms-shell.enable = true;

  # DMS's clipboard manager mirrors clips through wl-clipboard.
  environment.systemPackages = with pkgs; [
    wl-clipboard
  ];
}
