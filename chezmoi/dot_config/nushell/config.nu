# ~/.config/nushell/config.nu

$env.config.show_banner = false
$env.config.edit_mode = "emacs"
$env.config.history.max_size = 10000
$env.config.history.file_format = "sqlite"

alias ll = ls -l
alias la = ls -a

# zoxide (smart cd): generate into vendor autoload, auto-loaded by nu on startup
mkdir ($nu.data-dir | path join "vendor/autoload")
zoxide init nushell | save -f ($nu.data-dir | path join "vendor/autoload/zoxide.nu")

# yazi: bring the cwd back into the shell on exit
def --env y [...args] {
  let tmp = (mktemp -t "yazi-cwd.XXXXXX")
  yazi ...$args --cwd-file $tmp
  let cwd = (open $tmp)
  if $cwd != $env.PWD and ($cwd | path exists) {
    cd $cwd
  }
  rm -fp $tmp
}
