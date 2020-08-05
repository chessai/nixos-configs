chessai's nixos configs
=======================

## layout
* editors/    : editor configs
* fonts/      : fonts available to the system
* games/      : video games
* home/       : home-manager configuration
* i18n/       : console fonts, locale, keymap
* kernel/     : linux kernel configuration
* networking/ : host info, wireless, firewall, nameservers, etc.
* nix/        : binary caches, system nixpkgs, nix system
* overlays/   : miscellaneous overlays
* pavu/       : pavucontrol configuration
* scripts/    : useful shell scripts
* security/   : security-related config
* services/   : all my systemd services (e.g. docker, hoogle, postgres, etc.)
* systemd/    : systemd configuration
* time/       : system time/location
* users/      : system users

## building
you need some secrets.nix files for the network stuff,
once you get that you can build one of the `configuration-*.nix`
files with:

```
nix-build -E '(import <nixpkgs/nixos> { configuration = ./configuration-machine.nix; }).system'
```

but replace `machine` with the relevant string
