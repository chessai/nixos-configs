{ config, pkgs, lib, ... }:

{
  services.grafana = {
    enable = true;
    protocol = "http";
  };
}
