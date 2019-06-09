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

        haskell-meetup = {
          psk = secrets.haskell-meetup;
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
