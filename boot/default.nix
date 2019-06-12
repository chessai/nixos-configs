{ config, pkgs, ... }:

{
  boot = {
    # Clean up /tmp on boot
    cleanTmpDir = true;

    loader = {
      grub = {
        enable = true;
        version = 2;
        efiSupport = true;
        efiInstallAsRemovable = false;
        device = "nodev";
      };

      efi = {
        canTouchEfiVariables = true;
      };
    };
  };
}
