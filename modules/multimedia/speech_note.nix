{ ... }:

{
  imports = [
    ../system/flatpak.nix
  ];

  services.flatpak.packages = [
    { appId = "net.mkiol.SpeechNote"; origin = "flathub"; }
    { appId = "net.mkiol.SpeechNote.Addon.amd"; origin = "flathub"; }
  ];

  programs.ydotool.enable = true;
  users.users.glaumar.extraGroups = [ "ydotool" ];
}

 