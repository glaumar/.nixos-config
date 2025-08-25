{ pkgs, config, ... }:

{
  imports = [
    ./secrets.nix
  ];

  sops.secrets.user_passwd = {
    neededForUsers = true;
  };

  sops.secrets.ssh_passphrase = {
    mode = "0440";
    owner = config.users.users.glaumar.name;
    group = config.users.users.glaumar.group;
  };

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  users.users.glaumar = {
    isNormalUser = true;
    description = "glaumar";
    extraGroups = [ "networkmanager" "wheel" ];
    hashedPasswordFile = config.sops.secrets.user_passwd.path;
  };
}
