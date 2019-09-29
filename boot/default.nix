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
        efiInstallAsRemovable = true;
        device = "nodev";
      };

      efi = {
        canTouchEfiVariables = false;
      };
    };

    kernel = {
      sysctl = {
        # this is insecure
        #"net.ipv4.ping_group_range" = "0 2147483647";
      };
    };

  };
}
