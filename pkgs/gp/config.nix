{ config, pkgs, ... }:

let
  gpSrc = pkgs.fetchFromGitHub {
    owner = "chessai";
    repo = "gp";
    rev = "bb4e587e8eef84271aebad4cb5ea42d34e86f142";
    sha256 = "1a9i2xflwqj9s5fj1yrrny5dcf4ap8gq17dgpl4l40gn7pr4sv35";
  };
in
{
  config = {
    nixpkgs.overlays = [
      (super: self: {
         gp = self.callPackage gpSrc {};
      })
    ];

    environment.systemPackages =
      let
        gpScript = pkgs.writeShellScriptBin "gp" ''
          GP_CONF=${./config.dhall} sudo --preserve-env=GP_CONF ${pkgs.gp}/bin/gp $1
        '';
      in [
        gpScript
      ];
  };
}
