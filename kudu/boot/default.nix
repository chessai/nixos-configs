{ ... }:

{
  boot = {
    # cleanup /tmp on boot
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

    zfs = {
      devNodes = "/dev"; # fixes some VM issues
      forceImportRoot = false;
      forceImportAll = false;
    };

    kernelParams = [
      "boot.shell_on_fail"
      "panic=30"
      "boot.panic_on_fail" # reboot the machine upon fatal boot issues
    ];
  };
}
