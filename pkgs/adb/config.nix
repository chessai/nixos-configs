{ config, pkgs, ... }:

{
  # user must be in group "adbusers"
  programs.adb.enable = true;
}
