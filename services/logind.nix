{ config, pkgs, ... }:

{
  # Disable systemd screen/tmux killer
  services.logind.extraConfig = ''
    KillUserProcesses=no
  '';
}
