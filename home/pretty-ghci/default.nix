{ config, pkgs, ... }:

let
  ghciPrettySrc = pkgs.fetchFromGitHub {
    owner = "harpocrates";
    repo = "pretty-ghci";
    rev = "2e326d7b6481335d060cd278ee766c088eef6948";
    sha256 = "0ix40bkh9qlqjkywrnfijv7ybml8zk4a6n4xnprrl2kx0mj9lsqr";
  };
in
{
  config = {
    nixpkgs.overlays = [
      (super: self: {
        pp-ghci = pkgs.haskellPackages.callCabal2nix "ghci-pretty" ghciPrettySrc {};
      })
    ];
  };
}
