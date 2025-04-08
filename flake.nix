{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # You can access packages and modules from different nixpkgs revs at the same time.
    # nixpkgs.unstable-url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # plasma-manager = {
    #   url = "github:nix-community/plasma-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.home-manager.follows = "home-manager";
    # };

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
    daeuniverse.url = "github:daeuniverse/flake.nix";

    sopts-nix = {
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
    # , plasma-manager
    , sops-nix
    , glaumar_nur
    , nix-index-database
    , nix-flatpak
    , ...
    }: {
      nixosConfigurations = {
        NixOS2501 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ({
              nixpkgs.overlays = [
                (final: prev: {
                  glaumarPkgs = glaumar_nur.packages."${prev.system}";
                })
              ];
            })

            daeuniverse.nixosModules.daed
            sops-nix.nixosModules.sops
            nix-flatpak.nixosModules.nix-flatpak
            nix-index-database.nixosModules.nix-index
            system/DesktopPC/default.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.sharedModules = [
              ];
              home-manager.users.glaumar = import user/DesktopPC/default.nix;
              home-manager.backupFileExtension = "Backup";
            }
          ];
        };

        SteamDeck = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ({
              nixpkgs.overlays = [
                (final: prev: {
                  glaumarPkgs = glaumar_nur.packages."${prev.system}";
                })
              ];
            })

            daeuniverse.nixosModules.daed
            jovian-nixos.nixosModules.default
            sops-nix.nixosModules.sops
            nix-flatpak.nixosModules.nix-flatpak
            # nix-index-database.nixosModules.nix-index
            system/SteamDeck/default.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.sharedModules = [
              ];
              home-manager.users.glaumar = import user/SteamDeck/default.nix;
              home-manager.backupFileExtension = "hm_backup";
            }
          ];
        };
      };
    };
}

