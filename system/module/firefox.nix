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

        /* ---- EXTENSIONS ---- */
        # Check about:support for extension/add-on ID strings.
        # Valid strings for installation_mode are "allowed", "blocked",
        # "force_installed" and "normal_installed".
        ExtensionSettings = {
          "*".installation_mode = "normal_installed"; # blocks all addons except the ones specified below

          # adguard-adblocker
          "adguardadblocker@adguard.com" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/adguard-adblocker/latest.xpi";
            installation_mode = "force_installed";
          };

          # Proton Pass
          "78272b6fa58f4a1abaac99321d503a20@proton.me" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/proton-pass/latest.xpi";
            installation_mode = "force_installed";
          };

          # Privacy Badger:
          "jid1-MnnxcxisBPnSXQ@jetpack" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
            installation_mode = "force_installed";
          };

          # uBlock Origin
          # "uBlock0@raymondhill.net" = {
          #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          #   installation_mode = "force_installed";
          # };

          # Dark Reader
          "addon@darkreader.org" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
            installation_mode = "force_installed";
          };

          # Vimium
          "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/vimium-ff/latest.xpi";
            installation_mode = "force_installed";
          };

          # LuLu Translate
          "{20c4c749-556c-4659-8827-16dfaf0601f9}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/欧路翻译-网页划词翻译工具/latest.xpi";
            installation_mode = "force_installed";
          };

          # # plasma-integration
          # "plasma-browser-integration@kde.org" = {
          #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/plasma-integration/latest.xpi";
          #   installation_mode = "force_installed";
          # };
        };

        /* ---- PREFERENCES ---- */
        # Check about:config for options.
        Preferences = {
          "extensions.pocket.enabled" = lock-false;
          "browser.newtabpage.activity-stream.showSponsored" = lock-false;
          "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
        };
      };
    };

}
