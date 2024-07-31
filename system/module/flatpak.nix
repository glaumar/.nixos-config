{ ... }:

{
  services.flatpak.enable = true;

  # services.flatpak.remotes = lib.mkOptionDefault [{
  #   name = "flathub-beta";
  #   location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
  # }];

  services.flatpak.update.auto.enable = false;
  services.flatpak.uninstallUnmanaged = false;
  services.flatpak.packages = [
    # { appId = "com.brave.Browser"; origin = "flathub"; }
    "com.github.tchx84.Flatseal"
  ];

  services.flatpak.overrides = {
    global.Context = {
      filesystems = [
        "xdg-config/fontconfig:ro" 
      ];
    };
  };


    xdg.portal = {
      enable = true;
      config.common.default = [ "gtk" ];
    };
  }
