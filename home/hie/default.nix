{ ... }:

let
  all-hies = import (builtins.fetchTarball "https://github.com/infinisil/all-hies/tarball/master") {};
in
{
  environment.systemPackages = [
    # Install stable HIE for GHC 8.6.4, 8.6.3 and 8.4.3
    (all-hies.selection { selector = p: { inherit (p) ghc865 ghc844; }; })
  ];
}
