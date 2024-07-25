{ pkgs, config, ... }:

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
  
  xdg.configFile =
    let
      conf = "${config.home.homeDirectory}/.nixos-config/dotfiles/.config";
    in
    with config.lib.file;  {
      "tealdeer/config.toml".source = mkOutOfStoreSymlink "${conf}/tealdeer/config.toml";
    };

}
