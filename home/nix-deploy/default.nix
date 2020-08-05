{ config, pkgs, ... }:

{
  config = {
    nixpkgs.overlays = [
      (self: super: {
        nix-deploy = (import (pkgs.fetchFromGitHub {
          owner = "awakesecurity";
          repo = "nix-deploy";
          rev = "a63ad8aa9b2459c91edd4e1c6b7c08ec7e9955c6";
          sha256 = "0prdqycqqcy4k53zxmdihn3gfc2bahr040060h8h4979bdyr22x5";
        } + "/release.nix") {}).nix-deploy;
      })
    ];
  };
}
