{ pkgs, ... }:

{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowBroken = false;
      allowUnsupportedSystem = false;
    };

    overlays = [
      (import ./../overlays/texlive.nix)
    ];
  };

}
