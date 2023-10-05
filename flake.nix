# BASED OFF: https://github.com/Misterio77/nix-starter-configs
{
  description = "Jeff's NixOS and Home Manager Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";                     # Stable Nix Packages (Default)
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";         # Unstable Nix Packages

    home-manager = {                                                      # User Environment Manager
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";                      # base 16 color maanger
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
    # NixOS entrypoint
    nixosConfigurations = {
      frame = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs outputs build; };
        modules = [./nixos/configuration.nix];
      };
    };
  };

}

