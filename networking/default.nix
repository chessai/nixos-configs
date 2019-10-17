{ pkgs, ... }:

let
  secrets = import ./secrets.nix;
in
{
  networking = {
    hostId = "2def5b23";
    hostName = "chessai-kudu";

    networkmanager = {
      enable = false;
    };

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

        "Big Jilm's PP party" = {
          psk = secrets.delia;
        };

        "Big Jilm's PP party _5G" = {
          psk = secrets.delia;
        };

        "FRITZ!Box Guest/ Gastzugang" = {
          psk = secrets.icfp;
        };

        scandic_easy = {}; # free wifi

        "Little Skips East" = {
          psk = secrets.little_skips_east;
        };

        MSFTGUEST = {
          psk = secrets.msft;
        };
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
