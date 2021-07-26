{
  networking.firewall.allowedTCPPorts = [ 1883 ];
  services.mosquitto = {
    enable = true;
    users = {};
    host = "0.0.0.0";
    allowAnonymous = true;
    aclExtraConf = ''
      topic readwrite #
    '';
  };
}
