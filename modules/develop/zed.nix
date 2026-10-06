{ pkgs, ... }:
{
  # Config: chezmoi/dot_config/zed/settings.json + repo .zed/{settings,tasks}.json
  environment.systemPackages = with pkgs; [
    zed-editor
    opencode # ACP agent used by Zed
  ];

  # Fonts used by the Zed config
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    noto-fonts-cjk-sans
  ];
}
