{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.chezmoi
    (pkgs.writeShellScriptBin "dotfiles" ''
      exec ${pkgs.chezmoi}/bin/chezmoi --source "$HOME/.nixos-config/chezmoi" "$@"
    '')
  ];
}
