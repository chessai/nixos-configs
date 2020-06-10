{ pkgs, ... }:

{
  services.postgresql = {
    package = pkgs.postgresql_10;
    enable = false;
    enableTCPIP = false;
    authentication = ''
      local all all trust
      host all all 127.0.0.1/32 trust
      host all all ::1/128 trust
    '';
    extraConfig = ''
      timezone = 'UTC'
    '';
  };
}
