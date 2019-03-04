{ pkgs, ... }:

{
  networking = {
    hostId = "2def5b23";
    hostName = "chessai-kudu";

    wireless = {
      enable = true;
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
