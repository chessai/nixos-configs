{ config, pkgs, ... }:

{
  imports = [
    ./cups.nix
    ./docker.nix
    ./duckling.nix
    ./duckling/default.nix
    ./hoogle.nix
    ./locate.nix
    ./postgresql.nix
    ./sshd.nix
    ./toxvpn.nix
    ./xserver.nix
    ./zfs.nix
  ];
}
