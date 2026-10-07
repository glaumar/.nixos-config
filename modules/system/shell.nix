{ pkgs, ... }:

{
  programs.nushell = {
    enable = true;
  };

  # programs.nushell does not register a login shell; add it manually
  environment.shells = [ pkgs.nushell ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  environment.systemPackages = with pkgs; [
    zoxide
  ];
}
