{ config, pkgs, ... }:

{
  imports = [
    ./chessai.nix
    ./postgres.nix
    ./root-authorizedKeys.nix
  ];
}
