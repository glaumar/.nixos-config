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

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    # steamdeck package
    jovian-nixos = {
      url = "github:Jovian-Experiments/Jovian-NixOS";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    glaumar_aur = {
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
  };

  outputs =
    { nixpkgs
    , home-manager
    , daeuniverse
    , jovian-nixos
    , plasma-manager
    , sops-nix
    , glaumar_aur
    , nix-index-database
    , ...
    }: {
      nixosConfigurations = {
        Thinkpad = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          # specialArgs = { inherit inputs; };
          modules = [
            ({
              nixpkgs.overlays = [
                (final: prev: {
                  glaumarPkgs = glaumar_aur.packages."${prev.system}";
                })
              ];
            })
            system/Thinkpad/default.nix
            daeuniverse.nixosModules.daed
            sops-nix.nixosModules.sops

            home-manager.nixosModules.home-manager
            {
              # home-manager.extraSpecialArgs = inputs;
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.glaumar = import user/Thinkpad/default.nix;

              # rename overwrited file
              home-manager.backupFileExtension = "hm_backup";
            }
          ];
        };

        SteamDeck = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          # specialArgs = { inherit inputs; };
          modules = [
            ({
              nixpkgs.overlays = [
                (final: prev: {
                  glaumarPkgs = glaumar_aur.packages."${prev.system}";
                })
              ];
            })

            daeuniverse.nixosModules.daed
            jovian-nixos.nixosModules.default
            sops-nix.nixosModules.sops
            system/SteamDeck/default.nix

            home-manager.nixosModules.home-manager
            {
              # home-manager.extraSpecialArgs = inputs;
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.sharedModules = [
                plasma-manager.homeManagerModules.plasma-manager
                nix-index-database.hmModules.nix-index
              ];
              home-manager.users.glaumar = import user/SteamDeck/default.nix;
              home-manager.backupFileExtension = "hm_backup";
            }
          ];
        };
      };
    };
}

