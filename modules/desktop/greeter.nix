{ pkgs, config, ... }:

{
  # Minimal TUI greeter on greetd, replacing SDDM. greetd is desktop-agnostic;
  # the niri session is launched directly via its niri-session wrapper.
  # useTextGreeter avoids boot messages interrupting the TUI.
  services.greetd = {
    enable = true;
    useTextGreeter = true;
    settings.default_session.command =
      "${pkgs.tuigreet}/bin/tuigreet --time --asterisks --remember "
      + "--cmd ${config.programs.niri.package}/bin/niri-session";
  };
}
