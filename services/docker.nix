{
  virtualisation.docker.enable = true;
  virtualisation.docker.storageDriver = "zfs";
  users.users.chessai.extraGroups = [ "docker" ];
}
