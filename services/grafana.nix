{ config, pkgs, lib, ... }:

{
  services.grafana = {
    enable = false;
    protocol = "http";
  };
}
