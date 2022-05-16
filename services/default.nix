{ config, pkgs, ... }:

{
  imports = [
    ./cups.nix
    ./docker.nix
    ./duckling.nix
    ./hoogle.nix
    ./locate.nix
    ./mysql.nix
    ./postgresql.nix
    ./sshd.nix
    ./tailscale.nix
    ./toxvpn.nix
    ./xserver.nix
    ./zfs.nix
  ];
}
