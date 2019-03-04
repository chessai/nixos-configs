{ config, pkgs, ... }:

{
  services.locate = {
    enable = true;
    interval = "00 12 * * *";
  };
}
