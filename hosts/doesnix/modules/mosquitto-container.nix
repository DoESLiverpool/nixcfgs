{
  # Creates a bridge called 'br0' which will bridge eno1, eno2 and also the
  # container's own network interface, via the hostBridge attribute. This means
  # that the container has its own IP, just like a virtual machine, so it can
  # also have its own avahi-daemon and broadcast mqtt.local as its hostname on
  # mDNS; which is the motivation for doing this. Note, wireless devices cannot
  # be bridged, so don't try! :D
  networking.useNetworkd = true;
  # when using systemd-networkd useDHCP must be set to false
  networking.useDHCP = false;
  networking.bridges = {
    br0 = {
      interfaces = [ "eno1" "eno2" ];
    };
  };
  networking.interfaces = {
    br0 = {
      ipv4.addresses = [{ address = "10.0.100.4"; prefixLength = 8; }];
    };
  };

  # Creates a nixos-container named "mosquitto" with the hostname "mqtt" which
  # broadcasts over mDNS
  containers.mosquitto = {
    extraFlags = [ "-U" ];
    autoStart = true;
    ephemeral = true;
    privateNetwork = true;
    hostBridge = "br0";
    localAddress = "10.0.100.1/8";
    config = { config, pkgs, ... }: {
      imports = [ ./mosquitto.nix ../../../mixins/avahi.nix ];
      networking.hostName = "mqtt";
    };
  };
}
