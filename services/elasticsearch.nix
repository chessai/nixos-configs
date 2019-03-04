{ pkgs, ... }:

{
  services.elasticsearch = {
    enable = true;
    package = pkgs.elasticsearch6;
  };
}
