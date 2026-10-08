# ~/.config/nushell/config.nu

$env.config.show_banner = false
$env.config.edit_mode = "emacs"
$env.config.history.max_size = 10000
$env.config.history.file_format = "sqlite"

alias l = ls
alias ll = ls -l
alias la = ls -a
alias ch = chezmoi

# zoxide (smart cd): generate into vendor autoload, auto-loaded by nu on startup
mkdir ($nu.data-dir | path join "vendor/autoload")
zoxide init nushell | save -f ($nu.data-dir | path join "vendor/autoload/zoxide.nu")

# carapace: argument completion for external commands (git, nix, docker, ...).
# Same vendor-autoload pattern as zoxide above (nu loads these after config.nu).
# Bridges let carapace fall back to other shells' completions when it lacks one.
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'
carapace _carapace nushell | save -f ($nu.data-dir | path join "vendor/autoload/carapace.nu")

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
