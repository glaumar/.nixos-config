{ pkgs, ... }:

{
  # 1. How to share a folder:
  #    $ net usershare add --long videos /home/glaumar/Videos/ "" "Everyone:r"  "guest_ok=n"
  #
  # 2. How to change sops.secrets.samba_passwd :
  #    $ sops secrets/default.yaml

  sops.secrets.samba_passwd = {
    restartUnits = [
      "samba-smbd.service"
      "samba-wsdd.service"
      "samba-winbindd.service"
      "samba-nmbd.service"
    ];
  };

  # https://wiki.archlinux.org/title/Samba#Enable_Usershares
  users.groups.sambashare = { };
  users.users.glaumar.extraGroups = [ "sambashare" ];
  system.activationScripts.samba = ''
  
    if [ ! -e ~/var/lib/samba/usershares ];then
      mkdir -p /var/lib/samba/usershares
      chown root:sambashare /var/lib/samba/usershares
      chmod 1770 /var/lib/samba/usershares
    fi

    if [ ! -e /home/glaumar/Public ];then
      mkdir -p /home/glaumar/Public
      chown glaumar:users /home/glaumar/Public
      chmod 0755 /home/glaumar/Public
    fi
    
    export PATH="${pkgs.shadow}/bin:${pkgs.samba}/bin:$PATH"

    export SAMBA_PASSWD="$(cat /run/secrets/samba_passwd)"
    smbpasswd -a glaumar -s << EOF
    ''${SAMBA_PASSWD}
    ''${SAMBA_PASSWD}
    EOF

    gpasswd sambashare -a glaumar
  '';

  # https://nixos.wiki/wiki/Samba#Stale_file_handle
  services.samba = {
    enable = true;
    securityType = "user";
    openFirewall = true;
    extraConfig = ''
      workgroup = WORKGROUP
      server string = SteamDeck
      netbios name = SteamDeck
      use sendfile = yes
      # hosts allow = 192.168.146. 127.0.0.1 localhost
      # hosts deny = 0.0.0.0/0
      guest account = glaumar
      map to guest = bad user
      
      usershare path = /var/lib/samba/usershares
      usershare max shares = 100
      usershare allow guests = yes
      usershare owner only = yes 
    '';

    shares = {
      public = {
        path = "/home/glaumar/Public";
        "guest ok" = "yes";
        "public" = "yes";
        "writable" = "yes";
        "create mask" = "0644";
        "directory mask" = "0755";
        "force user" = "glaumar";
        "force group" = "users";
      };
    };
  };

  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };

}
