{ config, pkgs, ... }:

{
  services.node-red = {
    enable = true;
    openFirewall = true;
    withNpmAndGcc = true;
  };
}
