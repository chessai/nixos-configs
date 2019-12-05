{ pkgs, config, ... }:

let
  # why (import <nixpkgs> {})? because `imports` cannot
  # depend on the value of `pkgs`. this is a rather
  # non-obvious fact pointed out to me by clever.
  oldNixpkgsSrc = (import <nixpkgs> {}).fetchFromGitHub {
    owner = "NixOS";
    repo = "nixpkgs";
    rev = "35f0ffb7049ce7522b157807f02b9835441c8041";
    sha256 = "0j0hrzr9b57ifwfhggpzm43zcf6wcsj8ffxv6rz7ni7ar1x99x2c";
  };
in
{
  disabledModules = [ "services/search/elasticsearch.nix" ];

  imports = [
    "${oldNixpkgsSrc}/nixos/modules/services/search/elasticsearch.nix"
  ];

  services.elasticsearch = {
    enable = false;
    package = pkgs.elasticsearch5;
    extraConf = ''
      node.attr.speed: fast
    '';
  };

  nixpkgs.overlays = [
    (self: super: {
      elasticsearch5 = (import oldNixpkgsSrc {}).elasticsearch5;
    })
  ];
}
