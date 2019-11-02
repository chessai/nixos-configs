{ config, pkgs, ... }:

let
  gpSrc = pkgs.fetchFromGitHub {
    owner = "chessai";
    repo = "gp";
    rev = "1dc4364f920ee3535f9a0665c9a4db755ee8151b";
    sha256 = "1zw25rsy6pxcfmpzb4al2kr39idhgcc962lf13bb4s820lrh9ax4";
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
