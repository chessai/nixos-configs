chessai's nixos configs
=======================

## goal
goal is to have no one service manage its own configuration, instead
for all things to be centralised, therefore making my system as
reproducibleas possible.

## things configured:
* boot/       : bootloader, efi
* networking/ : host info, wireless, firewall, nameservers
* nix/        : binary caches, system nixpkgs, nix system
* pkgs/       : mainly vim, system packages
* services/   : all my systemd services (e.g. docker, hoogle, postgres, sshd, etc.)
* users/      : system users
