{ pkgs, ... }:

{
  services.postgresql = {
    package = pkgs.postgresql_12;
    enable = true;
    enableTCPIP = false;
    authentication = ''
      local all all trust
      host all all 127.0.0.1/32 trust
      host all all ::1/128 trust
    '';
    settings = {
      timezone = "UTC";
    };
  };
}
