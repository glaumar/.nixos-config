{ pkgs, lib, ... }:

{
  # config example:
  #   https://github.com/gmodena/nix-flatpak#remotes
  #   https://github.com/gmodena/nix-flatpak/tree/main/testing-base

  services.flatpak = {
    # remotes = lib.mkOptionDefault [{
    #   # 备用镜像（上海交大）
    #   # 文档： https://mirror.sjtu.edu.cn/docs/flathub
    #   # 可能需要手动添加 GPG 密钥
    #   name = "sjtu";
    #   location = "https://mirror.sjtu.edu.cn/flathub";
    # }];
    enable = true;
    update.auto.enable = false;
    uninstallUnmanaged = false;
    packages = [
      { appId = "org.flatpak.Builder"; origin = "flathub"; }
      { appId = "com.github.tchx84.Flatseal"; origin = "flathub"; }
      { appId = "io.github.flattool.Warehouse"; origin = "flathub"; }
      { appId = "io.github.Predidit.Kazumi"; origin = "flathub"; }

      # for QRookie dev
      # { appId = "org.freedesktop.Sdk.Extension.openjdk21/x86_64/23.08"; origin = "flathub"; }
      # { appId = "org.kde.Sdk/x86_64/6.6"; origin = "flathub"; }
      # { appId = "org.kde.Platform/x86_64/6.6"; origin = "flathub"; }
    ];

    overrides = {
      global.Context = {
        filesystems = [
          "xdg-config/fontconfig:ro"
        ];
      };
    };
  };

  environment.systemPackages = [ pkgs.flatpak-builder ];

  xdg.portal = {
    enable = true;
    config.common.default = [ "gtk" ];
  };
}
