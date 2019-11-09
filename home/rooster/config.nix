{ config, pkgs, ... }:

let
  roosterSrc = pkgs.fetchFromGitHub {
    owner = "chessai";
    repo = "rooster";
    rev = "391c2c1bccb7b0e6dc3aa417f4edb0a1b964b8e2";
    sha256 = "1jq3yr4bpbfx1fxcdr8vkva8r6hjnb225rw0vq63m6z06hl0fl8z";
  };
in
{
  config = {
    nixpkgs.overlays = [
      (super: self: {
         rooster = self.callPackage roosterSrc {};
      })
    ];
  };
}
