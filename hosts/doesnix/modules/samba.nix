{
  networking.firewall.allowPing = true;
  networking.firewall.allowedTCPPorts = [ 445 139 5357 ];
  networking.firewall.allowedUDPPorts = [ 137 138 3702 ];

  services.samba-wsdd = {
    enable = true;
    discovery = true;
    workgroup = "WORKGROUP";
  };
  services.samba = {
    enable = true;
    extraConfig = ''
      hosts allow = 10.0.0.0/8 localhost
      hosts deny = 0.0.0.0/0
      guest account = nobody
      map to guest = bad user
    '';
    shares = {
      does-samba = {
        path = "/samba/does-samba";
        browseable = "yes";
        "read only" = "false";
        "guest ok" = "yes";
        comment = "The DoES Public Samba Share";
      };
    };
  };
  services.avahi = {
    enable = true;
    nssmdns = true;
    publish = {
      enable = true;
      addresses = true;
      domain = true;
      hinfo = true;
      userServices = true;
      workstation = true;
    };
    extraServiceFiles = {
      smb = ''
        <?xml version="1.0" standalone='no'?><!--*-nxml-*-->
        <!DOCTYPE service-group SYSTEM "avahi-service.dtd">
        <service-group>
          <name replace-wildcards="yes">%h</name>
          <service>
            <type>_smb._tcp</type>
            <port>445</port>
          </service>
        </service-group>
      '';
    };
  };
}
