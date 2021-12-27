{ pkgs, ... }:

let
  secrets = import ./secrets.nix;
in
{
  environment.systemPackages = [ pkgs.tailscale ];

  networking = {
    wireless = {
      enable = true;
      networks = {
        inherit (secrets)
          cwhome
          "69420"
          "1418";
      };
    };

    firewall = {
      enable = true;
      trustedInterfaces = [ "tailscale0" ]; # allow traffic from tailscale
      allowedUDPPorts = [ ];
      allowedTCPPorts = [ ];
    };
  };
}
