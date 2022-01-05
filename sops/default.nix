{ config, ... }:

{
  sops = {
    gnupg = {
      home = "/var/lib/sops";
      sshKeyPaths = [ ];
    };

    secrets = {
      "wpa_supplicant.conf" = {
        format = "binary";
        sopsFile = ./wpa_supplicant.conf;
        owner = "root";
        group = "root";
        path = "/etc/wpa_supplicant.conf";
      };
    };
  };
}
