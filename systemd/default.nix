{ config, pkgs, ... }:

{
  systemd = {
    coredump = {
      # no longer has any effect. enabled by default.
      # set boot.kernel.sysctl."kernel.core_pattern" = "core";
      # to disable.
      # enable = true;

      # increase size of core dump to 2^30 bytes
      extraConfig = ''
        ExternalSizeMax=${toString (8 * 1024 * 1024 * 1024)}
      '';
    };
  };
}
