{ ... }:

let
  secrets = import ./secrets.nix;
in
{
  networking = {
    networkmanager = {
      enable = false;
    };

    wireless = {
      enable = true;
      networks = {
        inherit (secrets)
          BootyholeCapone69
          mercury;
      };
    };

    firewall = {
      enable = true;
      allowedUDPPorts = [ ];
      allowedTCPPorts = [ ];
    };
  };
}
