{ pkgs, ... }:

{
  # flakes and new nix command
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    wget
    curl
  ];

  programs.git = {
    enable = true;
    lfs.enable = true;
  };

  # programs.vim = {
  #   enable = true;
  #   defaultEditor = true;
  # };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
