{ config, pkgs, ... }:

let
  pongSrc = pkgs.fetchFromGitHub {
    owner = "chessai";
    repo = "pong";
    rev = "b401054ddbbe509716fc35666faeecf6c54830c9";
    sha256 = "0a3awx4wnb1vga3n7b7cr753iilwc72hmgwbd3id7clfmqg9ndkb";
  };
in
{
  config = {
    nixpkgs.overlays = [
      (super: self: {
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
