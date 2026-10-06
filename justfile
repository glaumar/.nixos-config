switch:
  sudo nixos-rebuild switch

update:
  nix flake update

dotfiles_sync:
  chezmoi re-add

daed_conf_sync:
  sudo -E sops -e /etc/daed/wing.db > secrets/daed/wing.db

sops-edit:
  sops secrets/default.yaml

sops-update-keys:
  sops updatekeys secrets/default.yaml

repair:
  sudo nix-store --verify --check-contents --repair

list-generations:
  nixos-rebuild list-generations

delete-generation:
  sudo nix-collect-garbage --delete-older-than 90d
