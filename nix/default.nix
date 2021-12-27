{ lib, ... }:

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
  nix = {
    gc = {
      automatic = false;
    };

    buildCores = 8;

    trustedUsers = [
      "chessai"
      "root"
    ];

    binaryCaches = [
      "http://cache.nixos.org" # nixos.org
      # "http://cache.earthtools.ca" # clever
      "https://hydra.iohk.io" "https://iohk.cachix.org" # IOHK
    ];

    binaryCachePublicKeys = [
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=" "iohk.cachix.org-1:DpRUyj7h7V830dp/i6Nti+NEO2/nhblbov/8MW7Rqoo=" # IOHK
      # "c2d.localnet-1:YTVKcy9ZO3tqPNxRqeYEYxSpUH5C8ykZ9ImUKuugf4c=" # clever
    ];

    extraOptions = lib.mkOrder 1 ''
      gc-keep-derivations = true
      gc-keep-outputs = true
      auto-optimise-store = false
    '';
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowBroken = false;
      allowUnsupportedSystem = false;
      permittedInsecurePackages = [
      ];
    };

    overlays = builtins.map import (getFiles ./overlays);
  };
}
