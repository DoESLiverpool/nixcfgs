# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/samba.nix
      ../../mixins/avahi.nix
      ../../profiles/ssh.nix
      ../../profiles/makers.nix
      ../../profiles/wireless.nix
    ];

  boot.supportedFilesystems = [ "zfs" ];
  networking.hostId = "9ff35da5"; 

  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "nodev";

  boot.loader.grub.mirroredBoots = [
    { devices = [ "/dev/disk/by-uuid/CCF0-B208" ];
      path = "/boot-fallback"; }
  ];

  networking.hostName = "doesnix";

  time.timeZone = "Europe/London";

  networking.interfaces.eno1.useDHCP = true;
  networking.interfaces.eno2.useDHCP = true;
  networking.interfaces.wlp1s0.useDHCP = false;
  networking.interfaces.wlp0s20u1 = {
    useDHCP = true;
    ipv4.addresses = [ { address = "10.0.100.3"; prefixLength = 8; } ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim git
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

}
 
