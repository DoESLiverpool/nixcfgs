{ config, pkgs, inputs, ... }:
let
  system = "x86_64-linux";
  inkscape-with-extensions = inputs.nixpkgs-master.legacyPackages.${system}.inkscape-with-extensions.override {
      inkscapeExtensions = [ inputs.nixpkgs-master.legacyPackages.${system}.inkscape-extensions.inkcut ];
    };
in
{
  environment.systemPackages = [
    inkscape-with-extensions
  ];
}
