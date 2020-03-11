{ ... }:

{
  services.openvpn.servers = {
    mercury = {
      autoStart = false;
      updateResolvConf = true;
      config = ''
        remote vpn.mercury.co 1194 udp
        nobind
        dev tun
        persist-tun
        persist-key
        compress
        pull
        auth-user-pass
        tls-client
        ca /etc/vpn/mercury/ca.crt
        cert /etc/vpn/mercury/chessai.crt
        key /etc/vpn/mercury/chessai.key
        remote-cert-tls server
        auth-nocache
        reneg-sec 0
      '';
    };
  };
}
