{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.rotera;
  roteraSrc = pkgs.fetchFromGitHub {
    owner = "chessai";
    repo = "rotera";
    rev = "b00148475fe0312046c1e892d6bebfe3c022fbda";
    sha256 = "0nq0p69gmxqxh3icxxs3h6iganfa3q42xafvd9i45d543jdd85qs";
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
        rotera = pkgs.callPackage (_: roteraSrc) {};
      })
    ];
    users.users.rotera = {
      name = "rotera";
      description = "Rotera server user";
      home = "${cfg.dataDir}";
      isSystemUser = true;
      createHome = true;
      useDefaultShell = true;
    };

    systemd.services.rotera = {
      description = "Rotera Server";

      wantedBy = [ "multi-user.target" ];

      path = [ pkgs.rotera ];

      preStart = ''
        # Create data directory
        if ! test -e ${cfg.dataDir}; then
          mkdir -m 0700 -p ${cfg.dataDir}
          rm -f ${cfg.dataDir}/*.rot
          chown -R rotera:rotera ${cfg.dataDir}
        fi

        # Create .rot files
        ${foldl (_: r: ''
          '${pkgs.coreUtils}/touch' '${r}.rot'
        '') "" cfg.rotFiles}
      '';

      script = ''
        ls ${pkgs.rotera}
        exec ${pkgs.rotera}/bin/rotera-server
      '';

      serviceConfig = {
        ExecReload = "${pkgs.coreutils}/bin/kill -HUP $MAINPID";
        User = "rotera";
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
