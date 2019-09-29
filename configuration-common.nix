# This configuration is common to both conventional NixOS installs (see nixos-install) and NixOS installed by Nixops.

{ config, lib, pkgs, ... }:

with lib;

rec {
  imports = [
    ./pkgs/default.nix
    ./boot/default.nix
    ./services/default.nix
    ./nix/default.nix
    ./users/default.nix
    ./networking/default.nix
  ];

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  time = {
    timeZone = "America/New_York";
    hardwareClockInLocalTime = false;
  };

  hardware.pulseaudio.enable = true;

  systemd.coredump = {
    # no longer has any effect. enabled by default.
    # set boot.kernel.sysctl."kernel.core_pattern" = "core"; to disable.
    #enable = true;
    # increase size of core dump to 2^30 bytes
    extraConfig = "ExternalSizeMax=${toString (8 * 1024 * 1024 * 1024)}";
  };
}
