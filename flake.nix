{
  description = "Jeff's NixOS";

  inputs = {
    nixpkgs.url      = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
  {
    nixosConfigurations = {
      
      # framework 13 laptop - gnome w/ user "mid"
      frame = nixpkgs.lib.nixosSystem {
        specialArgs = inputs; 
        system      = "x86_64-linux";
        modules     = [

          # TODO : Connect the host user(name) to selection of home user(name/location)?
          ./host/frame
          ./modules/gnome.nix

          # home manager configuration
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs       = true;
              useUserPackages     = true;
              users.mid           = import ./home/mid;
            };
          }

        ];
      };
    };
  };

}

