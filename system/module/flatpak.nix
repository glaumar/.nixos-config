{ pkgs, ... }:

{
  # config example:
  #   https://github.com/gmodena/nix-flatpak#remotes
  #   https://github.com/gmodena/nix-flatpak/tree/main/testing-base

  services.flatpak.enable = true;
  services.flatpak.update.auto.enable = false;
  services.flatpak.uninstallUnmanaged = false;
  services.flatpak.packages = [
    "com.github.tchx84.Flatseal"
  ];

  services.flatpak.overrides = {
    global.Context = {
      filesystems = [
        "xdg-config/fontconfig:ro"
      ];
    };
  };

  environment.systemPackages = [ pkgs.flatpak-builder ];

  xdg.portal = {
    enable = true;
    config.common.default = [ "gtk" ];
  };
}