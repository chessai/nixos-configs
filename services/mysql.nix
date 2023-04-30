{ pkgs, ... }:

{
  services.mysql = {
    enable = false;
    package = pkgs.mariadb;
  };
}
