{ hardwareConfig # path to hardware-configuration.nix
, imports ? [] # path to other imports
}@args:

{ ... }:

{
  imports = [
    hardwareConfig

    ./editors
    ./fonts
    ./games
    ./home
    ./networking
    ./nix
    ./pavu
    ./scripts
    ./security
    ./services
    ./systemd
    ./time
    ./users
  ] ++ (args.imports or []);
}
