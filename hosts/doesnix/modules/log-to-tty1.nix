# This makes the first tty on startup useful, as logs will be sent to it
# instead of perpetually displaying the login prompt.

{ lib, config, pkgs, ... }:
{
  console.font = "ter-i32b";
  console.packages = with pkgs; [ terminus_font ];
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
  security.auditd.enable = true;
  security.audit.enable = true;
  systemd.services.journal-watch = {
    wantedBy = ["multi-user.target"];
    script = ''
      journalctl -f >/dev/tty1
    '';
    serviceConfig = {
      DynamicUser = true;
      SupplementaryGroups = ["adm" "tty"];
    };
  };
}

