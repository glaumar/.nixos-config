{ pkgs, ... }:

{
  # set default browser
  home.sessionVariables.BROWSER = "firefox-devedition";

  programs.firefox = {
    enable = true;
    package = pkgs.firefox-devedition;

    profiles = {
      dev_default = {
        id = 0;
        name = "dev-edition-default";
        isDefault = true;
        settings = {
          "browser.aboutConfig.showWarning" = false;
          "browser.contentblocking.category" = "strict";
          "browser.newtabpage.activity-stream.showSearch" = false;
          "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
          "browser.newtabpage.activity-stream.feeds.snippets" = false;
          "browser.newtabpage.activity-stream.topSitesRows" = 4;
          "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
          "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = false;
          "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = false;
          "browser.newtabpage.activity-stream.section.highlights.includeVisited" = false;

          "full-screen-api.warning.timeout" = 0;
          
          # use system title bar
          "browser.tabs.inTitlebar" = 0;
        };

        # extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        #   vimium
        # ];

        search = {
          force = true;
          engines = {
            "ArchWiki" = {
              urls = [{ template = "https://wiki.archlinux.org/index.php?search={searchTerms}"; }];
              iconUpdateURL = "https://wiki.archlinux.org/favicon.ico";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "a" ];
            };
            "Baidu" = {
              urls = [{ template = "https://www.baidu.com/s?wd={searchTerms}"; }];
              iconUpdateURL = "https://www.baidu.com/favicon.ico";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "ba" ];
            };
            "BiliBili" = {
              urls = [{ template = "https://search.bilibili.com/all?keyword={searchTerms}"; }];
              iconUpdateURL = "https://i0.hdslb.com/bfs/static/jinkela/long/images/favicon.ico";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "bi" ];
            };
            "Github" = {
              urls = [{
                template = "https://github.com/search";
                params = [
                  { name = "type"; value = "repositories"; }
                  { name = "q"; value = "{searchTerms}"; }
                ];
              }];
              iconUpdateURL = "https://github.githubassets.com/favicons/favicon-dark.svg";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "g" ];
            };
            "Flathub" = {
              urls = [{ template = "https://flathub.org/apps/search?q={searchTerms}"; }];
              iconUpdateURL = "https://flathub.org/favicon.svg";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "fh" ];
            };
            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "channel"; value = "unstable"; }
                  { name = "type"; value = "packages"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
              icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "np" ];
            };
            "Nix Options" = {
              urls = [{
                template = "https://search.nixos.org/options";
                params = [
                  { name = "channel"; value = "unstable"; }
                  { name = "type"; value = "packages"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
              icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "no" ];
            };
            "Home Manager Options" = {
              urls = [{
                template = "https://home-manager-options.extranix.com/";
                params = [
                  { name = "release"; value = "master"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
              iconUpdateURL = "https://home-manager-options.extranix.com/images/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "hm" ];
            };

            "NixOS Wiki" = {
              urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
              iconUpdateURL = "https://nixos.wiki/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "nw" ];
            };

            "Zhihu" = {
              urls = [{
                template = "https://www.zhihu.com/search";
                params = [
                  { name = "type"; value = "content"; }
                  { name = "q"; value = "{searchTerms}"; }
                ];
              }];
              iconUpdateURL = "https://static.zhihu.com/heifetz/favicon.ico";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "z" ];
            };
            # builtin engines only support specifying one additional alias
            "Google".metaData.alias = "gg";
            "Bing".metaData.alias = "bin";
            "DuckDuckGo".metaData.alias = "dd";
            "Wikipedia (en)".metaData.hidden = true;
          };
        };
      };
    };
  };
}
