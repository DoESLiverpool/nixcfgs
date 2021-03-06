{
  description = "A NixOS flake for the DoESLiverpool makerspace and the machines within it.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, nixpkgs, nixpkgs-master, home-manager, ... }@inputs: {
    nixosConfigurations = {
      vinylcutter = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          (import ./hosts/vinylcutter/configuration.nix)
          (import ./mixins/nix2.4.nix)
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.doesuser = { home.username = "doesuser"; home.homeDirectory = "/home/doesuser"; };
          }
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


