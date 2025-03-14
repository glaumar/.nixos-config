{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    # Noto fonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji

    # nerd fonts
    nerd-fonts.noto
    nerd-fonts.hack
    nerd-fonts.fira-mono
    nerd-fonts.fira-code
    nerd-fonts.monaspace
    nerd-fonts.droid-sans-mono
    nerd-fonts.dejavu-sans-mono
    nerd-fonts.sauce-code-pro
    nerd-fonts.jetbrains-mono

    # Microsoft fonts
    corefonts
    vistafonts
    vistafonts-cht
    vistafonts-chs
  ];
}
