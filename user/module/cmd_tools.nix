{ pkgs, config, dotfile, ... }:

{
  home.packages = with pkgs;[
    # cmd tool
    file
    neofetch
    btop
    xorg.xkill
    tealdeer
    tree

    # vim ide
    lunarvim
    nerdfonts
    wl-clipboard-rs
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
    # "git/config".source = mkOutOfStoreSymlink "${dotfile.conf}/git/config";
  };

}
