{ config, pkgs, ... }:

{
  imports = [
    ./chessai.nix
    ./root-authorizedKeys.nix
  ];
}
