{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    rustc # rust compiler (cargo alone cannot build)
    cargo
    clippy
    rust-analyzer # rust lsp
    rustfmt # rust formatter
  ];
}
