{
  description = "Jeff's NixOS";

  inputs = {
    nixpkgs.url      = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
  {
    # NixOS entrypoints
    nixosConfigurations = {
      
      # framework laptop
      "frame" = nixpkgs.lib.nixosSystem {
        specialArgs = inputs; 
        system      = "x86_64-linux";
        modules     = [
          ./nixos/configuration.nix
          
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs       = true;
              useUserPackages     = true;
              users.mid           = import ./home-manager/home.nix;
            };
          }

        ];
      };
    };
  };

}

