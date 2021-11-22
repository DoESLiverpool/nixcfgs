# cidPinList is a function that generates a script like this:
#
# ipfs pin x
# ipfs pin y
#
# Where x and y are the elements of pinContentIDList. This is then used in the
# postStart script for IPFS. This means content is pinned declaratively when
# IPFS starts, rather than anyone having to execute the command `ipfs pin x`
# manually.

{ config, lib, pkgs, ... }:
let
  pinContentIDList =
    [
      "QmQyR9Z55KLbPprWPHwoeVPwnvZ574Srs8Gt2F9SbqFXSe" # SenseSetup_V2.2.exe
      "QmYrgcP8yMjGN17h1MfVDUb4j2bUyMbyYtQTpUnafL8RWt" # Sense1_User_Guide.pdf
    ];
  cidPinList = lib.mkIf
    (builtins.isList pinContentIDList)
    (
      lib.concatStringsSep
        "\n"
        (
          map
            (x: "ipfs pin add ${x} &")
            pinContentIDList
        )
    );
in rec
{
  services.ipfs.enable = true;
  systemd.services.ipfs.postStart = cidPinList;
}
