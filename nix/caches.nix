{ ... }:

{
  nix = {
    binaryCaches = [
      "http://cache.nixos.org" # nixos.org
      "http://cache.earthtools.ca" # clever
      "https://hydra.iohk.io" # IOHK
#      "https://nixcache.reflex-frp.org" # Obsidian Systems
      "https://chessai.cachix.org" # my cachix
      "https://layer-3-cachix.cachix.org" # layer 3

    ];
    
    binaryCachePublicKeys = [
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=" # IOHK
      "c2d.localnet-1:YTVKcy9ZO3tqPNxRqeYEYxSpUH5C8ykZ9ImUKuugf4c=" # clever
#      "ryantrinkle.com-1:JJiAKaRv9mWgpVAz8dwewnZe0AzzEAzPkagE9SP5NWI=" # Obsidian Systems
      "chessai.cachix.org-1:KWZ25BN1sJQ5PXT4bY/ye2KpaVXG2+tO8N76sxsp7YQ=" # my cachix
      "layer-3-cachix.cachix.org-1:qV0cbRzoLEas8f0/ePOXTPKumVttPazCLyCZ26jQk04=" # layer 3
    ];
  };
}
