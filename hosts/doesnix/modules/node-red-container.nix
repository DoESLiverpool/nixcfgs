{
  # Gives the container access to the internet via NAT through the br0
  # interface created above.
  networking.nat = { 
    enable = true;
    internalInterfaces = [ "ve-node-red" ];
    externalInterface = "br0";
  };

  # Creates a nixos-container named "node-red" with the hostname "node-red"
  # which broadcasts over mDNS. 
  containers.node-red = {
    extraFlags = [ "-U" ];
    autoStart = true;
    ephemeral = false;
    privateNetwork = true;
    hostBridge = "br0";
    localAddress = "10.0.100.2/8";
    config = { config, pkgs, ... }: {
      imports = [ ./node-red.nix ../../../mixins/avahi.nix ];
      services.resolved.enable = true;
      networking = {
        hostName = "node-red";

	# Uses our own systemd-resolved inside the container and use it via
	# DHCP on eth0. useHostResolvConf is false, otherwise
	# services.resolved.enable = true; cannot be set.
        interfaces."eth0".useDHCP = true;
        useHostResolvConf = false;
      };
    };
  };
}
