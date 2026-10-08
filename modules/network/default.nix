{ pkgs, ... }:

{
  imports = [
    # ./dns.nix
    ./daed.nix
    # ./freenet.nix
  ];
}
