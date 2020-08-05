{ config, pkgs, ... }:

{
  imports = [
    ./cups.nix
    ./hoogle.nix
    ./locate.nix
    ./openvpn.nix
    ./postgresql.nix
    ./sshd.nix
    ./toxvpn.nix
    ./xserver.nix
    ./zfs.nix
  ];
}
