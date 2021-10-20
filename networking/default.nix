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
          "69420";
      };
    };

    firewall = {
      enable = true;
      allowedUDPPorts = [ ];
      allowedTCPPorts = [ ];
    };
  };
}
