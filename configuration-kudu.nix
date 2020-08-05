import ./make-system.nix {
  hardwareConfig = ./kudu/hardware-configuration.nix;
  imports = [
    ./kudu/boot
    ./kudu/networking
  ];
}
