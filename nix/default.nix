{ lib, ... }:

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
      "http://cache.earthtools.ca" # clever
      "https://hydra.iohk.io" # IOHK
      "https://com-mercury-nix-cache.s3.amazonaws.com" # mercury
      #"s3://com-mercury-nix-cache?profile=everyone"
    ];

    binaryCachePublicKeys = [
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=" # IOHK
      "c2d.localnet-1:YTVKcy9ZO3tqPNxRqeYEYxSpUH5C8ykZ9ImUKuugf4c=" # clever
      "com-mercury-nix-cache-1:yhfFlgvqtv0cAxzflJ0aZW3mbulx4+5EOZm6k3oML+I=" # mercury
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
        "p7zip-16.02"
      ];
    };

    overlays = [
    ];
  };
}
