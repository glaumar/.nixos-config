{ pkgs, ... }:

{
  # fcitx5 is desktop-agnostic; kept in its own module so it is independent of
  # any particular desktop environment.
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      # fcitx5-gtk
      # qt6Packages.fcitx5-qt
      qt6Packages.fcitx5-chinese-addons
      qt6Packages.fcitx5-with-addons
      fcitx5-anthy
      fcitx5-hangul
      fcitx5-pinyin-minecraft
      fcitx5-pinyin-moegirl
      fcitx5-pinyin-zhwiki
    ];
  };
}
