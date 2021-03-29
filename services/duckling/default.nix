{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.duckling;

  port = cfg.port;
in {
  options = {
    services.duckling = {
      enable = mkEnableOption "duckling";

      dataDir = mkOption {
        type = types.path;
        default = "/var/lib/duckling";
        description = ''
          Directory to store duckling's logs.
        '';
      };

      package = mkOption {
        type = types.package;
        default = pkgs.duckling;
        defaultText = "pkgs.duckling";
        example = literalExample "pkgs.duckling";
        description = "Version of duckling to run";
      };

      port = mkOption {
        type = types.int;
        default = 8080;
        description = ''
          Port on which duckling will run.
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    users.users.duckling = {
      description = "Duckling server service user";
      home        = cfg.dataDir;
      createHome  = true;
      # uid         = config.ids.uids.duckling;
    };

    systemd.services.duckling = {
      description = "Duckling server service";
      wantedBy    = [ "multi-user.target" ];
      after       = [ "network.target" ];

      environment = {
        PORT = builtins.toString cfg.port;
      };

      serviceConfig = {
        ExecStart = "${cfg.package}/bin/duckling-example-exe";
        Restart = "always";
        User = "duckling";
        WorkingDirectory = cfg.dataDir;
      };
    };
  };
}
