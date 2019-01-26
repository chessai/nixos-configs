{ pkgs, ... }:

{
  users.extraUsers.root.openssh.authorizedKeys.keys = [ ];
    # keys.taktoa.laptop keys.clever.amd ];

  users.extraUsers.chessai = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "wheel" "docker" ];
    openssh.authorizedKeys.keys = [ ]; # [ keys.clever.amd keys.taktoa.laptop ];
  };
  
  users.extraUsers.animus = {
    isNormalUser = true;
    extraGroups = [];
  };
  
  users.extraUsers.postgres = {
    isNormalUser = true;
    extraGroups = [ ];
  };
}
