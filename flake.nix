{
  description = "Nix Sauce";

  inputs = {
    nixpkgs.url      = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
  {
    nixosConfigurations = {

      #########################################################
      "frame" = nixpkgs.lib.nixosSystem {
        specialArgs = inputs; 
        system      = "x86_64-linux";
        modules     = [
          
          ./host/framework13
          ./de/gnome
          ./user/mid.nix

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.mid = import ./user/home.nix;
            };
          }
          
        ];
      };

      #########################################################
      # other nixos configs
      
    };
  };

}

