{ pkgs, ... }:

let
  secrets = import ./secrets.nix;
in
{
  networking = {
    hostId = "2def5b23";
    hostName = "chessai-kudu";

    wireless = {
      enable = true;

      networks = {
        ok = {
          psk = secrets.ok;
        };

        ok_mobile = {
          psk = secrets.ok_mobile;
        };

        haskell-meetup = {
          psk = secrets.haskell-meetup;
        };

        "FRITZ!Box Guest/ Gastzugang" = {
          psk = secrets.icfp;
        };

        scandic_easy = {}; # free wifi
      };
    };

    firewall = {
      enable = true;
      allowedUDPPorts = [ ];
      allowedTCPPorts = [ ];
    };

    # Google nameservers
    nameservers = [
      "8.8.8.8"
      "8.8.4.4"
    ];
  };
}
