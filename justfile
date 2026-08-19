switch: 
  sudo nixos-rebuild switch

update:
  nix flake update

sync_daed_conf: 
  sudo -E sops -e /etc/daed/wing.db > secrets/daed/wing.db

edit_secrets:
  sops secrets/default.yaml
  
repair:
  sudo nix-store --verify --check-contents --repair 
  
list-generations:
  nixos-rebuild list-generations
  
delete-generation:
  sudo nix-collect-garbage --delete-older-than 90d