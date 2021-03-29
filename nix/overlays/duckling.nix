self: super:

{
  duckling = super.haskell.packages.ghc884.callCabal2nix "duckling" (super.fetchFromGitHub {
    owner = "facebook";
    repo = "duckling";
    rev = "90a2e6d0ee0b66091ef96d94b20881cfd62805f4";
    sha256 = "1lvf3jz16wx3nzj8s4dgvrww4j8hnjy0rv4bsy0myxjp0h5cl0wa";
  }) {};
}
