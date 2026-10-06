{ pkgs, ... }:

{

  # How to Update wing.db:
  #   sudo -E sops -e /etc/daed/wing.db > secrets/daed/wing.db

  sops.secrets.wing_db = {
    format = "binary";
    sopsFile = ../../../secrets/daed/wing.db;
    restartUnits = [ "daed.service" ];
  };

  system.activationScripts.daed = ''
    NEW_MD5=$(md5sum /run/secrets/wing_db  | cut --delimiter=" " --fields=1)
    OLD_MD5=$(md5sum /etc/daed/wing.db  | cut --delimiter=" " --fields=1)

    if [ $NEW_MD5 != $OLD_MD5 ]; then
      cat /run/secrets/wing_db > /etc/daed/wing.db
    fi
  '';

  services.daed = {
    enable = true;

    # Use the patched package from the flake overlay (`pkgs.daed`), which swaps in
    # pnpm_10 so the upstream fetcherVersion=3 hash still evaluates/builds.
    # Remove once daeuniverse migrates to fetcherVersion 4.
    package = pkgs.daed;

    # allow to access the web dashboard from other devices
    openFirewall.enable = true;
    openFirewall.port = 2023;
    listen = "0.0.0.0:2023";
  };

}
