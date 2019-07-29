{ config, pkgs, ... }:

let
  pongSrc = pkgs.fetchFromGitHub {
    owner = "chessai";
    repo = "pong";
    rev = "f60b2a1278c6008a37f3a3c13c8d8bc2528e418c";
    sha256 = "13ncmrn4iw298wb34hfhy742vhfbjnjdrsz2vbgmsj83qgywb20m";
  };
in
{
  config = {
    nixpkgs.overlays = [
      (self: super: {
        pong = self.callPackage pongSrc {};
      })
    ];

    security.wrappers.pong = {
      source = "${pkgs.pong}/bin/pong";
      capabilities = "cap_net_raw+ep";
    };

    environment = {
      systemPackages = [ pkgs.pong ];
    };

  };
}
