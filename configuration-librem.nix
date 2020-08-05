import ./make-system.nix {
  hardwareConfig = ./librem/hardware-configuration.nix;
  imports = [
    ./librem/boot
    ./librem/networking
  ];
}
