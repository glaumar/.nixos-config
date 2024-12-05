{ pkgs, config, dotfile, ... }:

{
  home.packages = with pkgs;[
    # cmd tool
    file
    neofetch
    btop
    tealdeer
    tree
    pwgen
    busybox
    gh # github cli
    android-tools

    desktop-file-utils
    appstream
    just

    # vim ide
    lunarvim
    wl-clipboard-rs

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
  ];

  programs.direnv.enable = true;
  programs.nix-index.enable = true;
  programs.fish.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "glaumar";
    userEmail = "git@geekgo.tech";
    extraConfig.pull.rebase = true;
  };

  xdg.configFile = with config.lib.file;  {
    "tealdeer/config.toml".source = mkOutOfStoreSymlink "${dotfile.conf}/tealdeer/config.toml";
    "lvim".source = mkOutOfStoreSymlink "${dotfile.conf}/lvim";
    # "git/config".source = mkOutOfStoreSymlink "${dotfile.conf}/git/config";
  };

}
