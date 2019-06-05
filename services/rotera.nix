{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.rotera;
  roteraSrc = pkgs.fetchFromGitHub {
    owner = "chessai";
    repo = "rotera";
    rev = "55c655a0ace69572383176d66889649f6e4566e2";
    sha256 = "16nrzkk89prd96d3203vkxjgf7iiac7c5xf7wcva25j67aq1zwcn";
  };
in {
  options = {
    services.rotera = {

      enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Whether to run rotera-server.
        '';
      };

      rotFiles = mkOption {
        type = types.listOf types.int;
        default = [ ];
        description = ''
          Run rotera with these .rot files;
          The files will be created by nix, and placed into ${dataDir}.
        '';
      };

      dataDir = mkOption {
        type = types.path;
        default = "/var/lib/rotera";
        description = ''
          Where rotera should look for its .rot files.
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    nixpkgs.overlays = [
      (super: self: {
        rotera = self.callPackage roteraSrc {};
      })
    ];
    users.users.rotera = {
      name = "rotera";
      group = "rotera";
      description = "Rotera server user";
      home = "${cfg.dataDir}";
      isSystemUser = true;
      createHome = true;
      useDefaultShell = true;
    };

    users.groups.rotera.gid = null; # picked upon activation

    systemd.services.rotera = {
      description = "Rotera Server";

      wantedBy = [ "multi-user.target" ];

      path = [ pkgs.rotera ];

      preStart = ''
        # Create data directory
        if test ! -d ${cfg.dataDir}; then
          mkdir -m 0700 -p ${cfg.dataDir}
        else
          rm -f ${cfg.dataDir}/*.rot
        fi

        # Create .rot files
        ${concatMapStrings (r: ''
          '${pkgs.coreutils}/bin/touch' '${builtins.toString r}'.rot
        '') cfg.rotFiles}

        # make sure that rotera can access dataDir
        chown -R rotera:rotera ${cfg.dataDir}
      '';

      script = ''
        exec ${pkgs.rotera}/bin/rotera-server
      '';

      serviceConfig = {
        ExecReload = "${pkgs.coreutils}/bin/kill -HUP $MAINPID";
        User = "rotera";
        Group = "rotera";
        PermissionsStartOnly = true;

        WorkingDirectory = config.users.users.rotera.home;

        KillSignal = "SIGINT";
        KillMode = "mixed";

        TimeoutSec = 120;
      };
    };
  };

  meta.maintainers = with lib.maintainers; [ chessai ];
}
