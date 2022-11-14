# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/samba.nix
      ./modules/mosquitto-container.nix
      ./modules/node-red-container.nix
      ./modules/ipfs.nix
      ./modules/log-to-tty1.nix
      ../../mixins/avahi.nix
      ../../profiles/ssh.nix
      ../../profiles/makers.nix
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

  # Creates a bridge called 'br0' which will bridge eno1 to anything that
  # requests it elsewhere in the configuration, such as nixos-containers via
  # their hostBridge attribute. This means that such a container has its own
  # IP, just like a virtual machine, so it can also have its own avahi-daemon
  # and broadcast its hostname on mDNS; which is the motivation for doing this.
  # Note, wireless devices cannot be bridged, so don't try! :D
  #
  # MacVLANs might also be a better way of doing this in future.
  networking = {
    useNetworkd = true;
    # When using systemd-networkd useDHCP must be set to false
    useDHCP = false;
    bridges = {
      br0 = {
        interfaces = [ "eno1" ];
      };
    };
    interfaces = {
      br0 = {
        useDHCP = true;
        ipv4.addresses = [{ address = "10.0.100.3"; prefixLength = 8; }];
      };
    };
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
