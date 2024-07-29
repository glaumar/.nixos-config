{ lib, pkgs, ... }:


{

  # show public key:
  #   age-keygen -y ~/.config/sops/age/keys.txt
  #
  # edit secrets/default.yaml with sops:
  #   sops secrets/default.yaml

  # get target machine key:
  #   ssh-keyscan example.com | ssh-to-age
  # or:
  #   cat /etc/ssh/ssh_host_ed25519_key.pub | ssh-to-age
  
  # add key to .sops.yaml
  # update secrets keys:
  #  sops updatekeys secrets/default.yaml


  home.activation.glaumar_ssh_keygen = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    #!/usr/bin/env bash
    export PATH="${pkgs.openssh}/bin:$PATH"

    export SSH_PASSPHRASE=$(cat /run/secrets/ssh_passphrase)
    
    if [ ! -e ~/.ssh/id_ed25519 ];then
      run ssh-keygen -t ed25519 -a 32 -f ~/.ssh/id_ed25519  -N "$SSH_PASSPHRASE"
    fi
  '';

  home.activation.glaumar_age_keygen = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    #!/usr/bin/env bash
    export PATH="${pkgs.age}/bin:$PATH"
    
    if [ ! -e ~/.config/sops/age/keys.txt ];then
      run mkdir -p ~/.config/sops/age/
      run age-keygen -o ~/.config/sops/age/keys.txt
    fi
  '';
}
