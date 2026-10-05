{ config, lib, pkgs, ... }:
let
  dotfilesSource = "${config.home.homeDirectory}/.nixos-config/chezmoi";
in
{
  home.packages = [ pkgs.chezmoi ];

  xdg.configFile."chezmoi/chezmoi.toml".text = ''
    sourceDir = ${builtins.toJSON dotfilesSource}
  '';

  home.activation.chezmoiApply = lib.hm.dag.entryAfter [ "linkGeneration" ] ''
    ${pkgs.chezmoi}/bin/chezmoi --source ${dotfilesSource} apply --force
  '';
}
