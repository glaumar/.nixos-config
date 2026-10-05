switch:
  sudo nixos-rebuild switch
  dotfiles apply

update:
  nix flake update

# dotfiles (chezmoi, source: ./chezmoi); use the `dotfiles` wrapper
dotfiles-diff:
  dotfiles diff

dotfiles-apply:
  dotfiles apply

dotfiles-add:
  dotfiles re-add

dotfiles-cd:
  dotfiles cd

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