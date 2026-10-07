{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    histSize = 10000;
    histFile = "$HOME/.zsh_history";
    setOptions = [
      "HIST_IGNORE_DUPS"
      "SHARE_HISTORY"
      "HIST_FCNTL_LOCK"
      "AUTO_CD"
    ];

    # NixOS 的 zsh 模块不提供 autosuggestions / syntax-highlighting
    # （那是 home-manager 的选项），这里手动 source。
    interactiveShellInit = ''
      source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
      source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    '';
  };

  # starship 提示符；该模块会自动为 zsh 做集成
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      command_timeout = 1000;
    };
  };

  environment.systemPackages = with pkgs; [
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
  ];
}
