inputs:

import ./make-system.nix inputs {
  hardwareConfig = ./kudu/hardware-configuration.nix;
  imports = [
    ./kudu/boot
    ./kudu/networking
  ];
}
