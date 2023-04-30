let
  serverwgip = "10.0.0.1";
  clientwgip = "10.0.0.2";
in
{
  networking.firewall = {
    allowedUDPPorts = [ 51820 ];
  };

  networking.wg-quick.interfaces = {
    wg0 = {
      address = [ "${clientwgip}/32" ];
      # dns = [ "10.0.0.1" ];
      privateKeyFile = "/keys/wireguard/client.key";

      peers = [
        { # Wireguard VPS
          publicKey = "ijWT1uqSoiZquhEwAvoKobnYiCcgYAxas/8AwO79EXY=";
          allowedIPs = [ "${serverwgip}/24" ];
          endpoint = "3.95.64.169:51820";
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
