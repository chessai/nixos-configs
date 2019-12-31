{ config, pkgs, ... }:

let
  hinitSrc = pkgs.fetchFromGitHub {
    owner = "chessai";
    repo = "hinit";
    rev = "3e6591110fb6cbefd0fd1168b5e3619aa81e95df";
    sha256 = "18ybra2mah7id8087qsjch7sgsq1cgx6rfqd649j6cyirhcf68gv";
  };
in
{
  config = {
    nixpkgs.overlays = [
      (super: self: {
         hinit = self.callPackage hinitSrc { pkgs = self; };
      })
    ];
  };
}
