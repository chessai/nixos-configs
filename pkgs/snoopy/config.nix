{ config, pkgs, ... }:

let
  snoopySrc = pkgs.fetchFromGitHub {
    owner = "chessai";
    repo = "snoopy";
    rev = "4b5447e6d20765760ee4ee922a7ecea3777ea9d3";
    sha256 = "0iyij8391c4jrdwn968rd0adrpm1cx2c854i8rxh6l5a4f9wrm80";
  };
in
{
  config = {
    nixpkgs.overlays = [
      (super: self: {
         snoopy = self.callPackage snoopySrc {};
      })
    ];

    environment = {
      systemPackages = [ pkgs.snoopy ];
    };
  };
}
