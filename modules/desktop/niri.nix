{ ... }:

{
  # Scrollable-tiling Wayland compositor, launched by the greetd greeter. The
  # session is configured in chezmoi/dot_config/niri/config.kdl.
  # programs.niri.enable installs the niri package, so it is not listed again.
  programs.niri.enable = true;
}
