{ config, pkgs, ... }:

{
  hydenix.hm.terminals.enable = true;

  home.file = {
    ".config/kitty/kitty.conf" = {
      source = ./kitty.conf;
      force = true;
      mutable = true;
    };
  };
}
