{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nixd # Nix LSP (drives NixOS option completion in Zed's nixd `options` config)
    # nixpkgs-fmt # nix formatter
    nixfmt # nix formatter
  ];
}
