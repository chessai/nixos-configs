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
          cwhome;
      };
    };

    firewall = {
      enable = true;
      allowedUDPPorts = [ ];
      allowedTCPPorts = [ ];
    };
  };
}
