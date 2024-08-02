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
    "lvim".source = mkOutOfStoreSymlink "${dotfile.conf}/lvim";
    # "git/config".source = mkOutOfStoreSymlink "${dotfile.conf}/git/config";
  };

}
