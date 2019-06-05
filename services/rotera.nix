{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.rotera;
  roteraSrc = pkgs.fetchFromGitHub {
    owner = "chessai";
    repo = "rotera";
    rev = "386874a8a1052b1e9fd223bd1bc79070684f0241";
    sha256 = "1q2dz9xvly1x5xspjr5pwg8wshdmgv7ra5ddw4irvfxfh6b1v1sd";
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
          '${pkgs.rotera}/bin/rotera' create -s '${builtins.toString cfg.dataSectionSize}' -e '${builtins.toString cfg.entries}' -x '${builtins.toString cfg.expirations}' -r '${builtins.toString r}'.rot
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
