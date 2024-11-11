{ pkgs, config, ... }:

{
  # if install failed run :
  #    rm -rf /var/lib/nextcloud
  # and then try again (https://github.com/NixOS/nixpkgs/issues/111175)

  sops.secrets.nextcloud_passwd = {
    mode = "0440";
    owner = config.users.users.nextcloud.name;
    group = config.users.users.nextcloud.group;
  };

  # environment.systemPackages = with pkgs; [
  #   nextcloud-client
  # ];

  services.nextcloud = {
    enable = true;
    # package = pkgs.nextcloud28;
    hostName = "localhost";
    config.adminpassFile = config.sops.secrets.nextcloud_passwd.path;
  };
}
