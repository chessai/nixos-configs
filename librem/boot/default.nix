{ ... }:

{
  boot = {
    # cleanup /tmp on boot
    cleanTmpDir = true;

    loader = {
      grub = {
        enable = true;
        version = 2;
        device = "/dev/nvme0n1";
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
