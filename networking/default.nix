{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.tailscale ];

  networking = {
    networkmanager.enable = true;

    firewall = {
      enable = true;
      trustedInterfaces = [ "tailscale0" ]; # allow traffic from tailscale
      allowedUDPPorts = [ ];
      allowedTCPPorts = [ ];
    };
  };
}
