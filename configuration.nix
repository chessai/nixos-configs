# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./boot/default.nix
    ./home/default.nix
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

  system.stateVersion = "18.09";
}
