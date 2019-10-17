{ pkgs, ... }:

{
  services.postgresql = {
    enable = true;

    enableTCPIP = true;

    authentication = ''
      host testdb testuser 127.0.0.1/32 md5
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
