{ config, pkgs, ... }:

let
  pointfreeSrc = pkgs.fetchFromGitHub {
    owner = "bmillwood";
    repo = "pointfree";
    rev = "c515b45b995ace8f85ddd72630cc44c38accef55";
    sha256 = "12vlqpnjfxsd56fpbqavgx1hkbc3w3ji586hpjq4s177cgm983bp";
  };
in
{
  config = {
    nixpkgs.overlays = [
      (self: super: {
        pointfree = pkgs.haskellPackages.callCabal2nix "pointfree" pointfreeSrc {};
      })
    ];
  };
}
