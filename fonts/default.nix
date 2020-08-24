{ pkgs, ... }:

{
  fonts = {
    fonts = with pkgs; [
      dejavu_fonts
      freefont_ttf
      liberation_ttf_v2
      lmodern
      nerdfonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      noto-fonts-extra
      powerline-fonts
    ];
  };
}
