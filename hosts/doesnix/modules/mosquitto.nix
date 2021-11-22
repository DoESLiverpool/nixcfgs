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

# When we upgrade to NixOS 21.11, the config should look like this.
#
# {
#   networking.firewall.allowedTCPPorts = [ 1883 ];
#   services.mosquitto = {
#     enable = true;
#     settings.max_keepalive = 60;
#     listeners = [
#       {
#         port = 1883;
#         omitPasswordAuth = true;
#         users = {};
#         settings = {
#           allow_anonymous = true;
#         };
#         acl = [ "topic readwrite #" ];
#       }
#     ];
#   };
# }
