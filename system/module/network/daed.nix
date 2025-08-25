{ ... }:

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

    # allow to access the web dashboard from other devices
    openFirewall.enable = true;
    openFirewall.port = 2023;
    listen = "0.0.0.0:2023";
  };

}
