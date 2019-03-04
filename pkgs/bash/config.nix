{ config, pkgs, ... }:

{
  imports = [
    ./aliases.nix
  ];

  programs.bash = {
    enableCompletion = true;
  };
}
