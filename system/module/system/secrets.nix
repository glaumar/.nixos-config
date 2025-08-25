{ pkgs, ... }:

{
  # 1. How to get target machine public key:
  #    1) from local machine ~/.ssh/known_hosts: 
  #       $ ssh-keyscan example.com | ssh-to-age
  #    2) from remote machine /etc/ssh/ssh_host_ed25519_key.pub:
  #       $ cat /etc/ssh/ssh_host_ed25519_key.pub | ssh-to-age

  # 2. How to add new keys
  #    1) add public key to .sops.yaml
  #    2) $ sops updatekeys secrets/**

  environment.systemPackages = with pkgs; [
    sops
    age
    ssh-to-age
  ];
  # This will add secrets.yml to the nix store
  # You can avoid this by adding a string to the full path instead, i.e.
  # sops.defaultSopsFile = "/root/.sops/secrets/example.yaml";
  sops.defaultSopsFile = ../../../secrets/default.yaml;
  # This will automatically import SSH keys as age keys
  sops.age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
  # This is using an age key that is expected to already be in the filesystem
  # sops.age.keyFile = "/home/glaumar/.config/sops/age/keys.txt";
  # This will generate a new key if the key specified above does not exist
  # sops.age.generateKey = true;

}
