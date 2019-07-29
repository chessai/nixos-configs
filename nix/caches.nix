{ ... }:

{
  nix = {
    binaryCaches = [
      "http://cache.nixos.org" # nixos.org
      "http://cache.earthtools.ca" # clever
      "https://hydra.iohk.io" # IOHK
      "https://chessai.cachix.org" # my cachix
      "https://layer-3-cachix.cachix.org" # layer 3
      "https://nixcache.reflex-frp.org" # reflex
    ];

    binaryCachePublicKeys = [
      # IOHK
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
      # clever
      "c2d.localnet-1:YTVKcy9ZO3tqPNxRqeYEYxSpUH5C8ykZ9ImUKuugf4c="
      # chessai
      "chessai.cachix.org-1:KWZ25BN1sJQ5PXT4bY/ye2KpaVXG2+tO8N76sxsp7YQ="
      # layer 3
      "layer-3-cachix.cachix.org-1:qV0cbRzoLEas8f0/ePOXTPKumVttPazCLyCZ26jQk04="
      # reflex
      "ryantrinkle.com-1:JJiAKaRv9mWgpVAz8dwewnZe0AzzEAzPkagE9SP5NWI="
    ];
  };
}


