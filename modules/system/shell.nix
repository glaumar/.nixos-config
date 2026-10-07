{ pkgs, ... }:

{
  programs.nushell = {
    enable = true;
  };

  # programs.nushell 不注册 login shell，补上
  environment.shells = [ pkgs.nushell ];

  # starship 目前只对 fish 生效（NixOS 的 starship 模块不支持 nushell）
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      command_timeout = 1000;
    };
  };

  # direnv + nix-direnv（nix-direnv 是 direnv 的插件，二者需同时启用）
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = false; # zsh 已移除
    enableXonshIntegration = false; # 不使用 xonsh
  };

  environment.systemPackages = with pkgs; [
    zoxide
  ];
}
