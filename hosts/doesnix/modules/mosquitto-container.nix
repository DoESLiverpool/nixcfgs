{
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
      system.stateVersion = "21.05";
    };
  };
}
