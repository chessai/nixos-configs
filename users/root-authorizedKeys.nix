{ pkgs, ... }:

{
  users.extraUsers.root.openssh.authorizedKeys = { };
}
