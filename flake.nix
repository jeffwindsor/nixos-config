# BASED OFF: https://github.com/Misterio77/nix-starter-configs
{
  description = "Jeff's NixOS";

  inputs = {
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };
    nix-colors.url = "github:misterio77/nix-colors";           # base 16 color maanger
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs :
  let
    build = {
      hostname         = "frame";
      stateVersion     = "23.05";
      user             = "mid";
      userDescription  = "The Middle Way";
      timeZone         = "America/Los_Angeles";
    };
    inherit (self) outputs;
  in
  {
    # NixOS entrypoints
    nixosConfigurations = {
      frame = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs build; };
        modules = [./nixos/configuration.nix];
      };
    };
  };

}

