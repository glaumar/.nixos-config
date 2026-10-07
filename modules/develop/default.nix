{ pkgs, ... }:
{

  imports = [
    ./cli.nix
    ./distrobox.nix
    ./hack.nix
    ./wireshark.nix
    ./reqable.nix
    ./zed.nix
    ./languages.nix
  ];

  environment.systemPackages = with pkgs; [
    # Others
    dbgate

    # AI
    opencode
    # opencode-desktop

    # IDE
    vscode

    # vim ide
    # lunarvim
    # wl-clipboard-rs

    #--------------programming languages and tools--------------#
    # Language servers, toolchains, linters and formatters live in ./languages.nix

    # cpp
    # ccls # c/c++ lsp
    # libclang.python # git-clang-format

    # godot
    # godot_4
    # godot_4-export-templates-bin

    # csharp
    # dotnet-sdk_8
    # dotnet-runtime_8
    # dotnetPackages.Nuget

    #Jupyter
    # python314
    # python314Packages.pip
    # python314Packages.jupyter
    # jupyter

    #--------------other tools--------------#
    android-tools
    desktop-file-utils
    appstream
    direnv
  ];

  networking.firewall.allowedTCPPorts = [
    # Tauri mobile (Android) dev server + Vite HMR, reachable from the phone over LAN
    1420
    1421
  ];
}
