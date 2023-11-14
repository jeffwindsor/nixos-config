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
      
      # framework 13 laptop - gnome w/ user "mid"
      frame = nixpkgs.lib.nixosSystem {
        specialArgs = inputs; 
        system      = "x86_64-linux";
        modules     = [
          ./host/framework13
          ./desktop/gnome.nix

          {
            time.timeZone = "America/Los_Angeles";
            users.users.mid = {
              description  = "The Middle Way";
              extraGroups  = [ "networkmanager" "wheel" ];
              isNormalUser = true;
            };
          }

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs     = true;
              useUserPackages   = true;
              users.mid = {
                imports = [ ./home/default.nix ./home/gnome.nix ];
                home = {
                  username      = "mid";
                  homeDirectory = "/home/mid";
                };
              };
            };
          }

        ];
      };
    };
  };

}

