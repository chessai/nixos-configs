{ config, pkgs, ... }:

{
  imports = [
    ./docker.nix
    ./elasticsearch.nix
#    ./hoogle.nix
    ./locate.nix
    ./logind.nix
    ./mosh.nix
    ./nixosManual.nix
    ./nginx.nix
    ./ntp.nix
    ./postgresql.nix
    ./printing.nix
    ./sshd.nix
    ./teamspeak3.nix
    ./toxvpn.nix
    ./x/xmonad.nix
    ./x/xserver.nix
#    ./snmpd.nix
    ./zfs.nix
  ];

}
