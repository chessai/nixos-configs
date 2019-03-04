{ pkgs, ... }:

{
  users.extraUsers.postgres = {
    isNormalUser = true;
    extraGroups = [ ];
  };
}
