{ config, pkgs, ... }:

let
  snoopySrc = pkgs.fetchFromGitHub {
    owner = "chessai";
    repo = "snoopy";
    rev = "5e7d8bcb2cd23d3e4321d0a7fc5f9b84eb043fa0";
    sha256 = "1yca8i06v0655aszdg2g807y97b1r7ja8mpynhzs3gw3zdc8rgnj";
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
