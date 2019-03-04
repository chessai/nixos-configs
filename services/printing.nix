{ config, lib, pkgs, ... }:

{
  services.printing = {
    enable = true; # printing with CUPS
    drivers = with pkgs; [ hplipWithPlugin ];
  };
}
