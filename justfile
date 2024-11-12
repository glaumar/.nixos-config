switch: 
  sudo nixos-rebuild switch

update:
  nix flake update

sync_daed_conf: 
  sudo -E sops -e /etc/daed/wing.db > secrets/daed/wing.db

edit_secrets:
  sops secrets/default.yaml