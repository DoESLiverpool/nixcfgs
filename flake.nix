{
  description = "A NixOS flake for the Astralship and the machines aboard it.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
  };

  outputs = { self, nixpkgs, nixpkgs-master, ... }@inputs: {
    nixosConfigurations = {
      vinylcutter = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          (import ./hosts/vinylcutter/configuration.nix)
          (import ./mixins/nix2.4.nix)
        ];
        specialArgs = { inherit inputs; };
      };
      doesnix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          (import ./hosts/doesnix/configuration.nix)
          (import ./mixins/nix2.4.nix)
        ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}


