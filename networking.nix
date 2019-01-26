let
  sshPort = 22;
  httpPort = 80;
  snmpPort = 161;
in
{
  networking.hostId = "2def5b23";
  networking.hostName = "chessai-kudu"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.firewall.enable = true;
  networking.firewall.allowedUDPPorts = [ ]; 
  networking.firewall.allowedTCPPorts = [ snmpPort ];
}
