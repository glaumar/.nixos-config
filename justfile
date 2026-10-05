switch: 
  sudo nixos-rebuild switch

update:
  nix flake update

# dotfiles (chezmoi, source: ./chezmoi)
dotfiles-diff:
  chezmoi diff

dotfiles-apply:
  chezmoi apply

dotfiles-add:
  chezmoi re-add

dotfiles-cd:
  chezmoi cd

sync_daed_conf: 
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