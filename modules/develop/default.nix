{ pkgs, ... }:
{

  imports = [
    ./cli.nix
    ./distrobox.nix
    ./hack.nix
    ./wireshark.nix
    ./reqable.nix
    ./zed.nix
    ./rust.nix
    ./lua.nix
    ./nix.nix
  ];

  environment.systemPackages = with pkgs; [
    # Others
    dbgate

    # AI
    opencode
    opencode-desktop

    # IDE
    vscode

    # vim ide
    # lunarvim
    # wl-clipboard-rs

    #--------------programming languages and tools--------------#
    lemminx # xml lsp
    # yaml-language-server

    # cpp
    # ccls # c/c++ lsp
    clang-tools # c/c++ lsp and formatter
    libclang.python # git-clang-format

    # godot
    godot_4
    godot_4-export-templates-bin

    # npm and nodejs for slidev
    nodejs

    # js/ts
    yarn

    # csharp
    dotnet-sdk_8
    # dotnet-runtime_8
    dotnetPackages.Nuget
    omnisharp-roslyn # csharp lsp

    #Jupyter
    # python314
    # python314Packages.pip
    # python314Packages.jupyter
    jupyter

    #--------------other tools--------------#
    android-tools
    desktop-file-utils
    appstream
    just
    just-lsp
    direnv

    # latex
    texliveFull
  ];

  networking.firewall.allowedTCPPorts = [
    # Tauri mobile (Android) dev server + Vite HMR, reachable from the phone over LAN
    1420
    1421
  ];
}
