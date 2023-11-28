{
  description = "Nix Sauce";

  inputs = {
    nixpkgs.url      = "github:nixos/nixpkgs/nixos-23.11";
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
            users.users.mid = {
              description  = "The Middle Way";
              extraGroups  = [ "networkmanager" "wheel" ];
              isNormalUser = true;
            };
            time.timeZone = "America/Los_Angeles";
          }

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              users.mid = {
                home.username      = "mid";
                home.homeDirectory = "/home/mid";
                imports            = [ ./home/default.nix ./home/gnome.nix ];
              };
              useGlobalPkgs     = true;
              useUserPackages   = true;
            };
          }

        ];
      };
    };
  };

}

