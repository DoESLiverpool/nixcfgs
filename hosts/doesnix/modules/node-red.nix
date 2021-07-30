{ config, pkgs, ... }:

{
  imports = [
    (builtins.fetchurl {
      url = "https://raw.githubusercontent.com/NixOS/nixpkgs/b9c9d52aec8cc787629b4de6c7bb5732dca3ac0c/nixos/modules/services/web-apps/node-red.nix";
      sha256 = "0a7sfmwda8ssv1zllri1slskmhj7fyp9g0ay4w0nwznjdpdpsn9n";
    })
  ];

  services.node-red = {
    enable = true;
    openFirewall = true;
    withNpmAndGcc = true;
  };
}
