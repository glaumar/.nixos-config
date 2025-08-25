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

  fonts.fontconfig = {
    enable = true;
    defaultFonts.sansSerif = [
      "Noto Sans"
      # "Microsoft YaHei"
      "Noto Sans CJK SC"
      "Noto Sans CJK TC"
      "Noto Sans CJK JP"
      "Noto Sans CJK KR"
      "Noto Color Emoji"
      # "Noto Emoji"
    ];

    defaultFonts.serif = [
      "Noto Serif"
      "Noto Serif CJK SC"
      "Noto Serif CJK TC"
      "Noto Serif CJK JP"
      "Noto Serif CJK KR"
      "Noto Color Emoji"
      "Noto Emoji"
    ];

    defaultFonts.monospace = [
      "Noto Sans Mono"
      # "Hack"
      "Noto Sans Mono CJK SC"
      "Noto Sans Mono CJK TC"
      "Noto Sans Mono CJK HK"
      "Noto Sans Mono CJK JP"
      "Noto Sans Mono CJK KR"
      "Noto Color Emoji"
      "Noto Emoji"
    ];

    defaultFonts.emoji = [
      "Noto Color Emoji"
      "Noto Emoji"
    ];
  };

  fonts.fontDir.enable = true;
}
