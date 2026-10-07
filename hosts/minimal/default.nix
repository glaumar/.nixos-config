# Bootable minimal NixOS configuration — template for provisioning a new machine.
#
# To add a new host:
#   1. cp -r hosts/minimal hosts/<NewHost>
#   2. on the target machine, regenerate the hardware configuration:
#        nixos-generate-config --show-hardware-config \
#          > hosts/<NewHost>/hardware-configuration.nix
#   3. set networking.hostName below and give the user a password (see users.*)
#   4. register the host in flake.nix:
#        <NewHost> = mkHost { systemModule = ./hosts/<NewHost>/default.nix; };
#   5. nixos-rebuild switch --flake .#<NewHost>
#
# This host deliberately depends only on its own directory. Once the machine
# boots, pull in the shared modules (../../modules/...) as needed.

{ pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  # --- Boot ---
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # --- Networking ---
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # --- Nix ---
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;

  # --- Users ---
  # No password is set on purpose (repo rule: no plaintext passwords). Generate a
  # hash with `mkpasswd -m sha-512` and set it as `initialHashedPassword`, or
  # source it from sops the way the rest of this repo does (see
  # modules/system/user.nix). Until then the console auto-logs in as `nixos` so
  # the machine stays reachable.
  users.users.nixos = {
    isNormalUser = true;
    description = "nixos";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  # TEMPORARY first-boot bootstrap: remove once a password / SSH key is set.
  services.getty.autologinUser = "nixos";

  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  system.stateVersion = "24.05";
}
