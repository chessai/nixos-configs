{ pkgs, ... }:

{
  fonts = {
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      noto-fonts-extra
      dejavu_fonts
      liberation_ttf_v2
      powerline-fonts
      freefont_ttf
      lmodern
    ];
  };
}
