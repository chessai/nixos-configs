{ pkgs, lib, ... }:

let
  modifier = "Mod4";
in
{
  # technically outside of home-manager, but necessary.
  # kept here for congruency of thought
  programs.sway.enable = false;

  home-manager.users.chessai.wayland.windowManager.sway = {
    enable = false;

    config = {
      # note this is only used for window tiles.
      # needs to be a FreeType font
      fonts = [
        "source-code-pro 10"
      ];

      input = {
        "*" = {
          xkb_layout = "us";
          xkb_options = "caps:swapescape";
        };
      };

      output = {
        "*" = {
          #bg = "${./
        };
      };

      inherit modifier;

      keybindings = lib.mkOptionDefault {
        "${modifier}+b" = "exec ${pkgs.firefox}/bin/firefox";
      };

      terminal = "alacritty";
    };

    # sets up clamshell mode
    extraConfig = ''
      set $laptop eDP-1
      bindswitch --reload --locked lid:on output $laptop disable
      bindswitch --reload --locked lid:off output $laptop enable
    '';
  };
}
