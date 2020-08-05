let
  buildSystem = configuration: (import <nixpkgs/nixos> { inherit configuration; }).system;
in
{
  librem = buildSystem ./configuration-librem.nix;
  kudu = buildSystem ./configuration-kudu.nix;
}
