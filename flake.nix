# BASED OFF: https://github.com/Misterio77/nix-starter-configs
{
  description = "Jeff's NixOS Configuration Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
  let
    inherit (self) outputs;
  in
  {
    # NixOS entrypoint: nixos-rebuild --flake $LOC_NIXOS/#frame
    nixosConfigurations = {
      frame = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs; };
        modules = [./nixos/configuration.nix];
      };
    };
  };

}

