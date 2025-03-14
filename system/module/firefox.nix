{ pkgs, ... }:

{
  # set default browser
  environment.sessionVariables.BROWSER = "firefox-devedition";
  environment.systemPackages = [ pkgs.firefoxpwa ];
  programs.firefox =
    let
      lock-false = {
        Value = false;
        Status = "locked";
      };
      lock-true = {
        Value = true;
        Status = "locked";
      };
    in
    {
      enable = true;
      package = pkgs.firefox;
      nativeMessagingHosts.packages = [ pkgs.firefoxpwa ];
      languagePacks = [ "zh-CN" "en-US" "ja" ];

      /* ---- POLICIES ---- */
      # Check about:policies#documentation for options.
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        # EnableTrackingProtection = {
        #   Value = true;
        #   Locked = true;
        #   Cryptomining = true;
        #   Fingerprinting = true;
        # };
        DisablePocket = true;
        # DisableFirefoxAccounts = true;
        # DisableAccounts = true;
        # DisableFirefoxScreenshots = false;
        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        DontCheckDefaultBrowser = true;
        DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
        DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
        SearchBar = "unified"; # alternative: "separate"

        # https://mozilla.github.io/policy-templates/#searchengines-this-policy-is-only-available-on-the-esr
        # SearchEngines = {
        #   # Defualt = "google";
        #   Add = [
        #     # {
        #     # Name = "Example1";
        #     # URLTemplate = "https://www.example.org/q={searchTerms}";
        #     # "Method": "GET" | "POST",
        #     # "IconURL": "https://www.example.org/favicon.ico",
        #     # "Alias": "example",
        #     # "Description": "Description",
        #     # "PostData": "name=value&q={searchTerms}",
        #     # "SuggestURLTemplate": "https://www.example.org/suggestions/q={searchTerms}"
        #     # }


        #     {
        #       Name = "NixOS Packages";
        #       URLTemplate = "https://search.nixos.org/packages?channel=unstable&type=packages&query={searchTerms}";
        #       IconURL = "https://search.nixos.org/images/nix-logo.png";
        #       Alias = "np";
        #     }

        #     {
        #       Name = "NixOS Options";
        #       URLTemplate = "https://search.nixos.org/options?channel=unstable&query={searchTerms}";
        #       IconURL = "https://search.nixos.org/images/nix-logo.png";
        #       Alias = "no";
        #     }

        #   ];

        #   Remove = [ "Bing" "DuckDuckGo" "wikipedia (en)" ];

        # };

        /* ---- extensions ---- */
        # check about:support for extension/add-on id strings.
        # valid strings for installation_mode are "allowed", "blocked",
        # "force_installed" and "normal_installed".
        ExtensionSettings = {
          "*".installation_mode = "normal_installed"; # blocks all addons except the ones specified below

          # pwa
          "firefoxpwa@filips.si" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/pwas-for-firefox/latest.xpi";
            installation_mode = "force_installed";
          };
          # # adguard-adblocker
          # "adguardadblocker@adguard.com" = {
          #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/adguard-adblocker/latest.xpi";
          #   installation_mode = "force_installed";
          # };

          # proton pass
          "78272b6fa58f4a1abaac99321d503a20@proton.me" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/proton-pass/latest.xpi";
            installation_mode = "force_installed";
          };

          # # privacy badger:
          # "jid1-mnnxcxisbpnsxq@jetpack" = {
          #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
          #   installation_mode = "force_installed";
          # };

          # ublock origin
          # "ublock0@raymondhill.net" = {
          #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          #   installation_mode = "force_installed";
          # };

          # dark reader
          # "addon@darkreader.org" = {
          #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
          #   installation_mode = "force_installed";
          # };

          # # vimium
          # "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
          #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/vimium-ff/latest.xpi";
          #   installation_mode = "force_installed";
          # };

          # # lulu translate
          # "{20c4c749-556c-4659-8827-16dfaf0601f9}" = {
          #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/欧路翻译-网页划词翻译工具/latest.xpi";
          #   installation_mode = "force_installed";
          # };

          # plasma-integration
          "plasma-browser-integration@kde.org" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/plasma-integration/latest.xpi";
            installation_mode = "force_installed";
          };
        };

        /* ---- preferences ---- */
        # check about:config for options.
        Preferences = {
          # make firefox use the kde file picker.
          "widget.use-xdg-desktop-portal.file-picker" = 1;

          "browser.aboutConfig.showWarning" = lock-false;
          # "browser.contentblocking.category" = "strict";

          "extensions.pocket.enabled" = lock-false;

          "browser.newtabpage.activity-stream.showSponsored" = lock-false;
          "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
          "browser.newtabpage.activity-stream.showSearch" = lock-false;
          "browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
          "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
          "browser.newtabpage.activity-stream.topSitesRows" = 4;
          "browser.newtabpage.activity-stream.section.highlights.includePocket" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = lock-false;
          "browser.newtabpage.activity-stream.section.highlights.includeVisited" = lock-false;

          # hide fullscreen warning
          # "full-screen-api.warning.timeout" = 0;

          # use system title bar
          # "browser.tabs.inTitlebar" = 0;
        };
      };
    };

}
