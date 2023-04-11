# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "rtsx_pci_sdmmc" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "chessai-kudu/root";
      fsType = "zfs";
    };

  fileSystems."/nix" =
    { device = "chessai-kudu/nix";
      fsType = "zfs";
    };

  fileSystems."/home" =
    { device = "chessai-kudu/home";
      fsType = "zfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/319A-00E7";
      fsType = "vfat";
    };

  fileSystems."/var/lib/docker" =
    { device = "chessai-kudu/docker";
      fsType = "zfs";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/57b91ab2-8924-4c69-b0fb-ed5429ce7239"; }
    ];

  nix.settings.max-jobs = lib.mkDefault 8;
}
