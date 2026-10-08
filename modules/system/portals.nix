{ ... }:

{
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;

    # Plasma is gone; use the GTK portal as the default for all sessions. The
    # niri session's portal config (gnome/gtk, gnome-keyring Secret) is set by
    # programs.niri.enable.
    config.common.default = [ "gtk" ];
  };
}
