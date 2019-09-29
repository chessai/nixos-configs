{ config, pkgs, ... }:

{
  imports = [
    ./docker.nix
    ./elasticsearch.nix
    ./influxdb.nix
    ./grafana.nix
    ./kafka.nix
    ./locate.nix
    ./logind.nix
    ./mosh.nix
    ./nginx.nix
    ./nixosManual.nix
    ./ntp.nix
    ./postgresql.nix
    ./printing.nix
    ./rotera.nix
    ./sshd.nix
    ./teamspeak3.nix
    ./toxvpn.nix
    ./virtualbox.nix
    ./x/xmonad.nix
    ./x/xserver.nix
    ./zfs.nix
    ./zookeeper.nix
#    ./hoogle.nix
#    ./snmpd.nix
  ];

  services = {
    # this service is defined in ./rotera.nix.
    rotera = {
      enable = true;
      rotFiles = [ 3 13 4 ];
      clear = true;
    };
  };
}
