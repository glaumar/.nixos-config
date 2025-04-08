{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    # busybox

    # fun tools
    cmatrix
    # cool-retro-term
    hollywood

    # Network
    whois
    iproute2
    dig
    dnslookup
    # database for ip2location https://lite.ip2location.com/database-download
    ip2location
    speedtest-rs

    # Cracking
    hashcat
    # hashcat-utils
    # rar2hashcat
    # zip2hashcat
    hcxdumptool
    hcxtools
    
    # Wordlist
    wordlists


    # web
    tor-browser
  ];

  # services.geoipupdate = {
  #   enable = true;
  #   interval = "weekly";
  #   settings = {
  #     EditionIDs = [
  #       "GeoLite2-ASN"
  #       "GeoLite2-City"
  #       "GeoLite2-Country"
  #     ];
  #   };
  # };
}
