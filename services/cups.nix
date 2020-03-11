{ pkgs, ... }:

{
  services.printing = {
    enable = false;
    drivers = with pkgs; [ hplipWithPlugin ];
  };
}
