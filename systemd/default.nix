{ ... }:

{
  systemd = {
    coredump= {
      # increase size of core dump to 2^30 bytes
      extraConfig = ''
        ExternalSizeMax=${toString (8 * 1024 * 1024 * 1024)}
      '';
    };
  };
}
