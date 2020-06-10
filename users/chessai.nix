{ pkgs, ... }:

{
  users.extraUsers.chessai = {
    description = "chessai";
    isNormalUser = true;
    uid = 1000;
    createHome = true;
    home = "/home/chessai";
    extraGroups = [
      "audio"
      "docker"
      "libvirtd"
      "networkmanager"
      "users"
      "vboxusers"
      "video"
      "wheel"
      "adbusers"
      "wireshark"
    ];
  };
}
