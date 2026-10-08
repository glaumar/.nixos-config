{ ... }:

{
  # Session-wide variables shared by every desktop session.
  environment.sessionVariables = {
    # enable wayland for electron
    NIXOS_OZONE_WL = "1";
    # enable wayland for anki
    # ANKI_WAYLAND = 1;
  };
}
