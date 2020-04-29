{ ... }:

let
  secrets = import ./secrets.nix;
in
{
  networking = {
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
