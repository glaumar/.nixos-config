{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
    , home-manager
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
      user = "glaumar";

      pkgsOverlay = final: prev: {
        glaumarPkgs = glaumar_nur.packages.${prev.system};
      };

      mkHost =
        { systemModule
        , homeModule
        , extraModules ? [ ]
        , backupFileExtension
        }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            { nixpkgs.overlays = [ pkgsOverlay ]; }

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${user} = homeModule;
              home-manager.backupFileExtension = backupFileExtension;
            }

            systemModule
          ] ++ extraModules;
        };
    in
    {
      nixosConfigurations = {
        NixOS2501 = mkHost {
          systemModule = ./system/DesktopPC/default.nix;
          homeModule = import ./user/DesktopPC/default.nix;
          backupFileExtension = "Backup";
          extraModules = [
            daeuniverse.nixosModules.daed
            sops-nix.nixosModules.sops
            nix-flatpak.nixosModules.nix-flatpak
            nix-index-database.nixosModules.nix-index
          ];
        };

        SteamDeck = mkHost {
          systemModule = ./system/SteamDeck/default.nix;
          homeModule = import ./user/SteamDeck/default.nix;
          backupFileExtension = "hm_backup";
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
