{ config, pkgs, lib, ... }:

{
  home-manager.users.chessai.programs.alacritty = {
    enable = true;

    settings = lib.mkOptionDefault {
      font = {
        size = 22.0;

        normal = {
          family = "Fira Code Nerd Font";
          style = "Regular";
        };

        bold = {
          family = "Fira Code Nerd Font";
          style = "Bold";
        };

        italic = {
          family = "Fira Code Nerd Font";
          style = "Italic";
        };

        bold_italic = {
          family = "Fira Code Nerd Font";
          style = "Bold Italic";
        };
      };
    };
  };
}
