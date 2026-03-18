{ config, pkgs, ... }:

{
  hydenix.hm.hyprland.extraConfig = ''
    exec-once = kanshi -c ~/.config/kanshi/config
    exec-once = bluetoothctl power on
    exec-once = sleep 2 && bluetoothctl connect C9:26:02:27:F6:6C # Force `MX Master 3` mouse
  '';
}
