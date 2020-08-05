{
  disabledModules = [ "services/games/minecraft-server.nix" ];

  imports = [
    ./minecraft/server.nix
    ./minecraft
  ];
}
