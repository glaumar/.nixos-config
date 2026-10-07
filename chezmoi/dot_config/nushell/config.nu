# ~/.config/nushell/config.nu

$env.config.show_banner = false
$env.config.edit_mode = "emacs"
$env.config.history.max_size = 10000
$env.config.history.file_format = "sqlite"

alias ll = ls -l
alias la = ls -a

# zoxide（智能 cd）：生成到 vendor autoload，nu 启动自动加载
mkdir ($nu.data-dir | path join "vendor/autoload")
zoxide init nushell | save -f ($nu.data-dir | path join "vendor/autoload/zoxide.nu")

# yazi：退出时把 cwd 带回 shell
def --env y [...args] {
  let tmp = (mktemp -t "yazi-cwd.XXXXXX")
  yazi ...$args --cwd-file $tmp
  let cwd = (open $tmp)
  if $cwd != $env.PWD and ($cwd | path exists) {
    cd $cwd
  }
  rm -fp $tmp
}
