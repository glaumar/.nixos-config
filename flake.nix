{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    # You can access packages and modules from different nixpkgs revs at the same time.
    # nixpkgs.unstable-url = "github:nixos/nixpkgs/nixos-unstable";

    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      Thinkpad = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          system/Thinkpad/default.nix

          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.glaumar = import user/default.nix;
            
            # rename overwrited file
            home-manager.backupFileExtension = "hm_backup";
            
            home-manager.extraSpecialArgs = inputs;
          }
        ];
      };
    };
  };
}
