{ ... }:

{

  services.suwayomi-server = {
    enable = true;
    dataDir = "/DATA/suwayomi-server";
    settings = {
      server.downloadAsCbz = true;
      server.extensionRepos = [ "https://raw.githubusercontent.com/keiyoushi/extensions/repo/index.min.json" ];
      # server.systemTrayEnabled = true;
      server.port = 2514;
      server.ip = "0.0.0.0";
    };
    openFirewall = true;
  };

  # skip cloudflare captcha
  services.flaresolverr.enable = true;
}
