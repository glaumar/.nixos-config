{ pkgs, ... }:

{
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  users.users.glaumar = {
    isNormalUser = true;
    description = "glaumar";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
