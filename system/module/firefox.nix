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
      package = pkgs.firefox-devedition;
      nativeMessagingHosts.packages = [ pkgs.firefoxpwa ];
      languagePacks = [ "zh-CN" "en-US" "ja" ];

      /* ---- POLICIES ---- */
      # Check about:policies#documentation for options.
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        DontCheckDefaultBrowser = true;
        DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
        DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
        SearchBar = "unified"; # alternative: "separate"

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

          # proton pass
          "78272b6fa58f4a1abaac99321d503a20@proton.me" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/proton-pass/latest.xpi";
            installation_mode = "force_installed";
          };

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
          "widget.use-xdg-desktop-portal.file-picker" = 2;

          "browser.aboutConfig.showWarning" = lock-false;

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
          "full-screen-api.warning.timeout" = "0";
        };

        # https://mozilla.github.io/policy-templates/#searchengines-this-policy-is-only-available-on-the-esr
        SearchEngines = {
          # Defualt = "DuckDuckGo";
          Add = [
            # {
            # Name = "Example1";
            # URLTemplate = "https://www.example.org/q={searchTerms}";
            # "Method": "GET" | "POST",
            # "IconURL": "https://www.example.org/favicon.ico",
            # "Alias": "example",
            # "Description": "Description",
            # "PostData": "name=value&q={searchTerms}",
            # "SuggestURLTemplate": "https://www.example.org/suggestions/q={searchTerms}"
            # }


            {
              Name = "NixOS Packages";
              URLTemplate = "https://search.nixos.org/packages?channel=unstable&type=packages&query={searchTerms}";
              IconURL = "https://search.nixos.org/images/nix-logo.png";
              Alias = "np";
            }

            {
              Name = "NixOS Options";
              URLTemplate = "https://search.nixos.org/options?channel=unstable&query={searchTerms}";
              IconURL = "https://search.nixos.org/images/nix-logo.png";
              Alias = "no";
            }

            # {
            #   Name = "duckduck";
            #   URLTemplate = "https://duckduckgo.com/?q={searchTerms}";
            #   IconURL = "https://duckduckgo.com/favicon.ico";
            #   Alias = "ddg";
            # }

          ];

          Remove = [ "Bing" "Wikipedia (en)" ];

        };


      };
    };

}
