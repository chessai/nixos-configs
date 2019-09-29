# This configuration is common to both conventional NixOS installs (see nixos-install) and NixOS installed by Nixops.

{ config, lib, pkgs, ... }:

with lib;

rec {
  imports = [
    ./boot/default.nix
    ./i18n/default.nix
    ./kernel/default.nix
    ./networking/default.nix
    ./nix/default.nix
    ./pavu/default.nix
    ./pkgs/default.nix
    ./services/default.nix
    ./systemd/default.nix
    ./time/default.nix
    ./users/default.nix
  ];
}
