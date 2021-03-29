{ config, pkgs, ... }:

{
  imports = [
    ./cups.nix
    ./duckling.nix
    ./duckling/default.nix
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
