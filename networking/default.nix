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
          cwhome
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
