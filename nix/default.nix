{ config, pkgs, lib, ... }:

with lib;

{
  imports = [
    ./caches.nix
    ./nixpkgs.nix
  ];

  # Disable automatic daily upgrades
  system.autoUpgrade.enable = false;

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    buildCores = 8;

    trustedUsers = [
      "chessai"
      "root"
    ];

    extraOptions = mkOrder 1 ''
      gc-keep-derivations = true
      gc-keep-outputs = true
      auto-optimise-store = false
    '';
  };
}
