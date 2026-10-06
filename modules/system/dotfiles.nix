{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.chezmoi
  ];

  # System-wide chezmoi config (read from $XDG_CONFIG_DIRS/chezmoi/chezmoi.toml).
  # Points chezmoi at the dotfiles source in this repo; no wrapper needed.
  environment.etc."xdg/chezmoi/chezmoi.toml".source =
    ../../chezmoi.toml;
}
