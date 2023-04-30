{ pkgs, lib, ... }:

let
  getFilesWith = pred: dir:
    builtins.map (x: dir + "/${x}")
    (builtins.attrNames
    (lib.filterAttrs (name: type:
      pred name type && (type == "regular" || type == "symlink"))
      (builtins.readDir dir)));

  getFiles = getFilesWith (_: _: true);
in
{

  system.stateVersion = "22.11";

  nix = {
    gc = {
      automatic = false;
    };


    settings = {
      trusted-users = [
        "chessai"
        "root"
      ];

      cores = 8;

      substituters = [
        # NixOS.org
        "http://cache.nixos.org"

        # clever
        # "http://cache.earthtools.ca"

        # IOG
        # /Note/: aws url is there because their 301 redirect broke once.
        "https://cache.iog.io"
        "https://iohk-nix-cache.s3-eu-central-1.amazonaws.com/"
        # Old ones: "https://hydra.iohk.io" "https://iohk.cachix.org" # IOHK

        # Kadena
        "https://nixcache.chainweb.com"
      ];

      trusted-public-keys = [
        # IOHK
        "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=" "iohk.cachix.org-1:DpRUyj7h7V830dp/i6Nti+NEO2/nhblbov/8MW7Rqoo="

        # clever
        # "c2d.localnet-1:YTVKcy9ZO3tqPNxRqeYEYxSpUH5C8ykZ9ImUKuugf4c="

        # Kadena
        "nixcache.chainweb.com:FVN503ABX9F8x8K0ptnc99XEz5SaA4Sks6kNcZn2pBY="
      ];
    };

    # todo are `gc-*` outdated?
    extraOptions = lib.mkOrder 1 ''
      gc-keep-outputs = true
      keep-outputs = true
      gc-keep-derivations = true
      keep-derivations = true
      auto-optimise-store = false
      experimental-features = nix-command flakes ca-derivations
    '';
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowBroken = false;
      allowUnsupportedSystem = false;
      permittedInsecurePackages = [];
    };

    overlays = builtins.map import (getFiles ./overlays);
  };

  environment.systemPackages = [
    pkgs.cachix
  ];
}
