{ pkgs, ... }:
{


  environment.systemPackages = with pkgs;[

    # IDE
    vscode

    # vim ide
    lunarvim
    wl-clipboard-rs

    #--------------programming languages and tools--------------#
    # nix
    nil # nix lsp
    nixpkgs-fmt # nix formatter

    # lua
    lua-language-server

    lemminx # xml lsp 
    # yaml-language-server

    # cpp
    # ccls # c/c++ lsp
    clang-tools # c/c++ lsp and formatter
    libclang.python # git-clang-format

    # rust
    cargo
    clippy
    rust-analyzer # rust lsp
    rustfmt # rust formatter

    # godot
    godot_4
    godot_4-export-templates

    # npm and nodejs for slidev
    nodePackages.nodejs

    # js/ts
    yarn

    # csharp
    dotnet-sdk_8
    # dotnet-runtime_8
    dotnetPackages.Nuget
    omnisharp-roslyn # csharp lsp

    #--------------other tools--------------#
    android-tools
    desktop-file-utils
    appstream
    just
    direnv
  ];
}
