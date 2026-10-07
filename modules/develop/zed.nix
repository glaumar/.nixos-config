{ pkgs, ... }:
{
  # Config: chezmoi/dot_config/zed/private_settings.json + repo .zed/{settings,tasks}.json
  environment.systemPackages = with pkgs; [
    zed-editor
    opencode # ACP agent used by Zed
    bubblewrap # Zed Agent sandbox needs a non-setuid `bwrap` on $PATH (do not install via security.wrappers)
  ];

  # Fonts used by the Zed config
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    noto-fonts-cjk-sans
  ];
}
