{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # steamdeck package
    jovian-nixos = {
      url = "github:Jovian-Experiments/Jovian-NixOS";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    glaumar_nur = {
      url = "github:glaumar/nur";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # dae and daed
    daeuniverse = {
      url = "github:daeuniverse/flake.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Weekly updated nix-index database
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs =
    { nixpkgs
    , daeuniverse
    , jovian-nixos
    , sops-nix
    , glaumar_nur
    , nix-index-database
    , nix-flatpak
    , ...
    }:
    let
      system = "x86_64-linux";

      pkgsOverlay = final: prev: {
        glaumarPkgs = glaumar_nur.packages.${prev.stdenv.hostPlatform.system};

        # Workaround: daeuniverse pins `fetchPnpmDeps { fetcherVersion = 3; }`,
        # which current nixpkgs rejects once `pnpm` >= 11 (it hard-throws during
        # evaluation). Build daed's web assets with pnpm_10, where fetcherVersion 3
        # is still supported, so upstream's pinned pnpmDepsHash stays valid.
        daed = daeuniverse.packages.${prev.stdenv.hostPlatform.system}.daed.override {
          pnpm = prev.pnpm_10;
        };
      };

      mkHost =
        { systemModule
        , extraModules ? [ ]
        }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            { nixpkgs.overlays = [ pkgsOverlay ]; }

            systemModule
          ] ++ extraModules;
        };
    in
    {
      nixosConfigurations = {
        NixOS2501 = mkHost {
          systemModule = ./hosts/DesktopPC/default.nix;
          extraModules = [
            daeuniverse.nixosModules.daed
            sops-nix.nixosModules.sops
            nix-flatpak.nixosModules.nix-flatpak
            nix-index-database.nixosModules.nix-index
          ];
        };

        SteamDeck = mkHost {
          systemModule = ./hosts/SteamDeck/default.nix;
          extraModules = [
            daeuniverse.nixosModules.daed
            jovian-nixos.nixosModules.default
            sops-nix.nixosModules.sops
            nix-flatpak.nixosModules.nix-flatpak
            # nix-index-database.nixosModules.nix-index
          ];
        };
      };
    };
}
