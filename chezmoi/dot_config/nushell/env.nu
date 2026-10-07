# ~/.config/nushell/env.nu
$env.PATH = ($env.PATH | prepend $"($env.HOME)/.local/bin" | uniq)
