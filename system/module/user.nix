{ pkgs, config, ... }:

{
  imports = [
    ./secrets.nix
  ];

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  users.users.glaumar = {
    isNormalUser = true;
    description = "glaumar";
    extraGroups = [ "networkmanager" "wheel" ];
    hashedPasswordFile = config.sops.secrets.user_passwd.path;
  };
}
