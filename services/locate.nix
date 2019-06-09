{ config, pkgs, ... }:

{
  services.locate = {
    enable = true;
    interval = "hourly";
  };
}
