{ pkgs, config, dotfile, ... }:

{
  home.packages = with pkgs;[
    # cmd tool
    file
    neofetch
    btop
    xorg.xkill
    tealdeer
  ];

  programs.direnv.enable = true;

  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "glaumar";
    userEmail = "git@geekgo.tech";
  };

  xdg.configFile = with config.lib.file;  {
    "tealdeer/config.toml".source = mkOutOfStoreSymlink "${dotfile.conf}/tealdeer/config.toml";
  };

}
