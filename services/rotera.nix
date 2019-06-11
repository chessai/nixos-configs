{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.rotera;
  roteraSrc = pkgs.fetchFromGitHub {
    owner = "andrewthad";
    repo = "rotera";
    rev = "4384a4a882a4c566d69913bc17a27630e24758a8";
    sha256 = "14kzqgrq2hydijnw4175kq2vqwix1d7mmsnp5dndliww5la1j3sv";
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

      dataDir = mkOption {
        type = types.path;
        default = "/var/lib/rotera";
        description = ''
          Where rotera should look for its .rot files.
        '';
      };

      rotFiles = mkOption {
        type = types.listOf types.int;
        default = [ ];
        description = ''
          Run rotera with these .rot files;
          The files will be created by nix, and placed into ${cfg.dataDir}.
        '';
      };

      dataSectionSize = mkOption {
        type = types.int;
        default = 1024 * 1024;
        description = ''
          Size of data section in bytes.
        '';
      };

      entries = mkOption {
        type = types.int;
        default = 1024;
        description = ''
          Maximum number of events to preserve.
        '';
      };

      expirations = mkOption {
        type = types.int;
        default = 64;
        description = ''
          Batch size of expiration.
        '';
      };

      clear = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Whether or not to delete all .rot data upon service start.
        '';
      };

      port = mkOption {
        type = types.port;
        default = 8245;
        description = ''
          The port on which rotera-server will listen.
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
        fi

        # Clear out .rot files, if so desired.
        ${if cfg.clear then ''rm -f ${cfg.dataDir}/*.rot'' else '' ''}

        # Create .rot files
        ${concatMapStrings (r: ''
          '${pkgs.rotera}/bin/rotera' create -s '${builtins.toString cfg.dataSectionSize}' -e '${builtins.toString cfg.entries}' -x '${builtins.toString cfg.expirations}' -r '${builtins.toString r}'.rot
        '') cfg.rotFiles}

        # make sure that rotera can access dataDir
        chown -R rotera:rotera ${cfg.dataDir}
      '';

      script = ''
        exec ${pkgs.rotera}/bin/rotera-server --port ${builtins.toString cfg.port}
      '';

      serviceConfig = {
        ExecReload = "${pkgs.coreutils}/bin/kill -INT $MAINPID";
        User = "rotera";
        Group = "rotera";
        PermissionsStartOnly = true;

        WorkingDirectory = config.users.users.rotera.home;

        TimeoutSec = 120;
      };
    };
  };

  meta.maintainers = with lib.maintainers; [ chessai ];
}
