{ pkgs, ... }:

{
  # generate age key:
  #   age-keygen -o ~/.config/sops/age/keys.txt
  #
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

  environment.systemPackages = with pkgs; [
    sops
    age
    ssh-to-age
  ];

  # This will add secrets.yml to the nix store
  # You can avoid this by adding a string to the full path instead, i.e.
  # sops.defaultSopsFile = "/root/.sops/secrets/example.yaml";
  sops.defaultSopsFile = ../../secrets/default.yaml;
  # This will automatically import SSH keys as age keys
  sops.age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
  # This is using an age key that is expected to already be in the filesystem
  sops.age.keyFile = "/home/glaumar/.config/sops/age/keys.txt";
  # This will generate a new key if the key specified above does not exist
  sops.age.generateKey = true;
  # This is the actual specification of the secrets.
  sops.secrets.user_passwd = {
    neededForUsers = true;
  };
  sops.secrets.samba_passwd = { };

}
