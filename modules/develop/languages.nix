{ pkgs, ... }:
# Per-language developer tooling: language servers (LSP), linters, formatters and
# the toolchains behind them (runtimes, package managers, compilers, interpreters).
#
# Zed downloads its own language servers, but on NixOS the *native* ones
# (dynamically linked release binaries such as ruff or package-version-server)
# cannot run, and the npm-based ones are better served from nixpkgs too. Every
# Zed adapter looks its server up with `which(<name>)` first and only downloads
# when it is missing (`binary.ignore_system_version` defaults to false), so
# putting these on PATH makes Zed use them as-is.
#
# One server per format on purpose — no overlapping servers.
{
  environment.systemPackages = with pkgs; [
    # --- Nix ---
    nixd # nixd
    nixfmt # external formatter for the `Nix` language (repo .zed/settings.json)

    # --- Rust ---
    rustc # compiler (cargo alone cannot build)
    cargo
    clippy # linter
    rust-analyzer # rust-analyzer
    rustfmt # formatter

    # --- C / C++ ---
    clang-tools # clangd (LSP) + clang-format / clang-tidy

    # --- C# ---
    omnisharp-roslyn # OmniSharp

    # --- Python ---
    basedpyright # basedpyright-langserver (type checking)
    ruff # ruff (lint + format)

    # --- Go ---
    gopls

    # --- Zig ---
    zls

    # --- Lua ---
    lua-language-server # lua_ls
    stylua # formatter
    lua5_4 # interpreter
    lua54Packages.luarocks # package manager

    # --- TOML ---
    tombi # TOML LSP + formatter (needs the `tombi` extension; Zed does not use taplo)
    package-version-server # Cargo.toml / package.json version hints

    # --- JSON / HTML / CSS / ESLint (one package ships all four servers) ---
    vscode-langservers-extracted

    # --- YAML ---
    yaml-language-server

    # --- TypeScript / JavaScript ---
    vtsls # vtsls (chosen over typescript-language-server)
    nodejs # runtime (also needed by Zed's own prettier / npm tooling)
    yarn # package manager

    # --- Shell ---
    bash-language-server

    # --- Docker ---
    dockerfile-language-server # docker-langserver

    # --- Markdown ---
    marksman

    # --- LaTeX ---
    texlab # LSP
    texliveFull # TeX distribution / compiler

    # --- XML ---
    lemminx

    # --- Just ---
    just # task runner (the justfile interpreter)
    just-lsp # LSP

    # --- PHP ---
    intelephense

    # --- HTML / CSS helpers ---
    emmet-language-server # emmet abbreviation expansion
    tailwindcss-language-server # Tailwind IntelliSense (drop if unused)

    # --- Formatter ---
    prettier # JS/TS/JSON/CSS/HTML/YAML/Markdown
  ];
}
