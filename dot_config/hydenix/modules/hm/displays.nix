{ config, pkgs, ... }:

{
  hydenix.hm = {
    lockscreen.hyprlock = true;

    hyprland.hypridle = {
      enable = true;
      overrideConfig = builtins.readFile ./hypridle.conf;
    };
  };
}
