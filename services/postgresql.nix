{ pkgs, ... }:

{
  services.postgresql = {
    package = pkgs.postgresql_14;
    enable = true;
    #enableTCPIP = false;
    authentication = ''
      local all all trust
      host all all 127.0.0.1/32 trust
      host all all ::1/128 trust
    '';
    settings = {
      timezone = "UTC";
      log_destination = pkgs.lib.mkForce "stderr";
    };
    ensureDatabases = [
      "holdings"
      "holdings-development"
    ];
    ensureUsers = [
      {
        name = "chessai";
        ensurePermissions = {
          "DATABASE holdings" = "ALL PRIVILEGES";
          "DATABASE \"holdings-development\"" = "ALL PRIVILEGES";
        };
      }

      {
        name = "holdings";
        ensurePermissions = {
          "DATABASE holdings" = "ALL PRIVILEGES";
          "DATABASE \"holdings-development\"" = "ALL PRIVILEGES";
        };
      }
    ];
  };
}
