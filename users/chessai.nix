{ pkgs, ... }:

{
  users.extraUsers.chessai = {
    description = "chessai";
    isNormalUser = true;
    uid = 1000;
    extraGroups = [
      "audio"
      "docker"
      "libvirtd"
      "networkmanager"
      "users"
      "vboxusers"
      "video"
      "wheel"
    ];

    createHome = true;
    home = "/home/chessai";
  };
}
