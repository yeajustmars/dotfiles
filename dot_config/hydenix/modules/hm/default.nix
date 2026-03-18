# DOCUMENTATION:
#
# Visit https://github.com/richen604/hydenix/blob/main/docs/options.md for more options
#
{ config, pkgs, ... }:

{
  imports = [
    ./displays.nix
    ./keybindings.nix
    ./screenshots.nix
    ./startup.nix
    ./terminals.nix
    ./theme.nix
  ];

  hydenix.hm.enable = true;
}
