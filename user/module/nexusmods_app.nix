{ pkgs, ... }:

{
  home.packages = with pkgs;[
    # nexusmods-app
    nexusmods-app-unfree
  ];

  # TODO: add icon
  xdg.dataFile."applications/nexusmods-app.desktop".text = ''
    [Desktop Entry]
    Name=NexusMods.App
    Terminal=false
    Type=Application
    Exec=NexusMods.App
  '';
  xdg.dataFile."applications/nexusmods-app-nxm-handler.desktop".text = ''
    [Desktop Entry]
    Name=NexusMods.App NXM Handler
    Terminal=false
    Type=Application
    Exec=NexusMods.App protocol-invoke --url %u
    MimeType=x-scheme-handler/nxm
    NoDisplay=true
  '';
}
