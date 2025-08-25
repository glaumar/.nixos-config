{ pkgs, ... }:

{
  imports = [
    ./dns.nix
    ./daed.nix
  ];
}
