# BASED OFF: https://github.com/Misterio77/nix-starter-configs
{
  description = "Jeff's NixOS";

  inputs = {
    nixpkgs.url      = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # nix-colors.url   = "github:misterio77/nix-colors";           # base 16 color maanger
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs :
  {
    # NixOS entrypoints
    nixosConfigurations = {
      
      # framework laptop
      frame = nixpkgs.lib.nixosSystem {
        specialArgs = { 
          inherit inputs;
          build = {
            hostname         = "frame";
            stateVersion     = "23.11";
            user             = "mid";
            userDescription  = "The Middle Way";
            timeZone         = "America/Los_Angeles";
          };
        };
        modules = [ ./nixos/configuration.nix ];
      };
    };
  };

}

