{ pkgs, ... }:

{
  # all jovian options: 
  #   https://jovian-experiments.github.io/Jovian-NixOS/options.html
  jovian = {
    steam = {
      enable = true;
      autoStart = true;
      desktopSession = "plasma";
      user = "glaumar";
    };

    devices.steamdeck = {
      enable = true;
      autoUpdate = true;
    };

    decky-loader = {
      enable = true;
      user = "glaumar";
      extraPackages = with pkgs; [ python3 ];
    };
  };
}
