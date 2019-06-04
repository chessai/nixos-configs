{ config, pkgs, lib }:

{
  services.hoogle = {
    enable = false;
    port = 3000;
    
    packages = hp: with hp; [
      lens
    ];
  };
}
