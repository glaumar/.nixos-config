{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    reqable
  ];
  security.pki.certificateFiles = [
    # /etc/ssl/certs/ca-certificates.crt
    ./reqable-root.crt
  ];

  networking.firewall.allowedTCPPorts = [ 9999 ];
  networking.firewall.allowedUDPPorts = [ 9999 ];
}
