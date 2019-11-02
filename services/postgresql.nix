{ pkgs, ... }:

{
  services.postgresql = {
    enable = true;

    enableTCPIP = false;

    authentication = ''
      host all all 0.0.0.0/0 md5
    '';

    ensureDatabases = [
      "testdb"
    ];

    ensureUsers = [
      { name = "testuser";
        ensurePermissions = {
          "DATABASE testdb" = "ALL PRIVILEGES";
        };
      }
    ];
  };
}
