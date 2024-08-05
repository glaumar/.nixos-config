{ ... }:

{

  # How to Update wing.db:
  #   sudo -E sops -e /etc/daed/wing.db > secrets/daed/wing.db

  sops.secrets.wing_db = {
    format = "binary";
    sopsFile = ../../secrets/daed/wing.db;
  };

  system.activationScripts.daed = ''
    cat /run/secrets/wing_db > /etc/daed/wing.db
  '';

  services.daed = {
    enable = true;

    # allow to access the web dashboard from other devices
    openFirewall.enable = true;
    openFirewall.port = 2023;
    listen = "0.0.0.0:2023";
  };

}
