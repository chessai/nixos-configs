{ config, pkgs, ... }:

let
  pkgconfigSrc = pkgs.fetchFromGitHub {
    owner = "chessai";
    repo = "nix-pkgconfig";
    rev = "7e7482b74cfca1a061c7fe9e5bf10b6bf273ecec";
    sha256 = "0ix0hiib8b8d74i83znn5srzcgiw13mkxgyzswqhsyznjc4lpsq7";
  };
in
{
  config = {
    nixpkgs.overlays = [
      (super: self: {
        gamari-pkgconfig = self.callPackage pkgconfigSrc { nixpkgs = pkgs; };
      })
    ];

    #programs.bash = {
    #  shellAliases = {
    #    cabal = "${pkgs.cabal-install}/bin/cabal --with-pkg-config=${pkgs.gamari-pkgconfig}/pkg-config";
    #  };
    #};
  };
}
