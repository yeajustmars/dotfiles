{ config, pkgs, ... }:

{
  hydenix.hm = {
    lockscreen.hyprlock = true;

    hyprland.hypridle = {
      enable = true;
      extraConfig = ''
        general {
          lock_cmd = pidof hyprlock || hyprlock
          before_sleep_cmd = loginctl lock-session
          after_sleep_cmd = hyprctl dispatch dpms on && sleep 2 && kanshictl reload
        }

        listener {
          timeout = 600
          on-timeout = loginctl lock-session
        }

        listener {
          timeout = 600 # 10 minutes in seconds
          on-timeout = loginctl lock-session
        }

        listener {
          timeout = 1200 # 20 minutes in seconds
          on-timeout = hyprctl dispatch dpms off
          on-resume = hyprctl dispatch dpms on && sleep 2 && kanshictl reload
        }
      '';
    };
  };
}
