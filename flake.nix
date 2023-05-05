{
  description = "A NixOS flake for the DoESLiverpool makerspace and the machines within it.";

  inputs = {
    nixinate.url = "github:matthewcroughan/nixinate";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    home-manager.url = "github:nix-community/home-manager";
    robotnix.url = "github:danielfullmer/robotnix";
  };

  outputs = { self, nixpkgs, nixpkgs-master, home-manager, nixinate, robotnix, ... }@inputs: {
    apps = nixinate.nixinate.x86_64-linux self;
    robotnixConfigurations.admin-phone = robotnix.lib.robotnixSystem (import ./hosts/admin-phone);
    nixosConfigurations = {
      vinylcutter = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/vinylcutter/configuration.nix
          ./mixins/nix2.4.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.doesuser = { home.username = "doesuser"; home.homeDirectory = "/home/doesuser"; };
          }
          {
            _module.args.nixinate = {
              host = "vinylcutter.local";
              sshUser = "doesuser";
              buildOn = "remote"; # valid args are "local" or "remote"
            };
          }
        ];
        specialArgs = { inherit inputs; };
      };
      doesnix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/doesnix/configuration.nix
          ./mixins/nix2.4.nix
          {
            _module.args.nixinate = {
              host = "doesnix.local";
              sshUser = "matthew";
              buildOn = "remote"; # valid args are "local" or "remote"
            };
          }
        ];
        specialArgs = { inherit inputs; };
      };
    };
  };
}


