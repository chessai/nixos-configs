{ config, pkgs, ... }:

{
  imports = [
    ./cups.nix
    ./locate.nix
    ./openvpn.nix
    ./postgresql.nix
    ./sshd.nix
    ./x/xserver.nix
    ./zfs.nix
    ./nixosManual.nix
  ];
}
