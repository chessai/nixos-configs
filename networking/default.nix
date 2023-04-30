{ pkgs, ... }:

{
  imports = [
    ./wireguard.nix
  ];

  environment.systemPackages = [ pkgs.tailscale ];

  networking = {
    wireless = {
      enable = true;
      # empty set means "use /etc/wpa_supplicant.conf";
      # which is set by sops
      networks = { };
    };

    firewall = {
      enable = true;
      trustedInterfaces = [ "tailscale0" ]; # allow traffic from tailscale
      allowedUDPPorts = [ ];
      allowedTCPPorts = [ ];
    };
  };
}
