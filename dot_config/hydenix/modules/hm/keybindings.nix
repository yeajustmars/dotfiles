{ config, pkgs, ... }:

{
  hydenix.hm.hyprland.keybindings.extraConfig = ''
    # Main Controls
    # --------------------------------------------------------------------
    unbind = $mainMod, B
    unbind = $mainMod, Return
    unbind = $mainMod, E
    bind = $mainMod, B, exec, firefox
    bind = $mainMod, Return, exec, kitty
    bind = $mainMod, E, exec, dolphin

    bind = $mainMod SHIFT, K, exec, hyprctl dispatch exec kanshictl reload

    # Unbind all function keys
    # --------------------------------------------------------------------
    unbind = , XF86AudioMute
    unbind = , XF86AudioLowerVolume
    unbind = , XF86AudioRaiseVolume
    unbind = , XF86AudioMicMute
    unbind = , F1
    unbind = , F2
    unbind = , F3
    unbind = , F4
    unbind = , F5
    unbind = , F6
    unbind = , F7
    unbind = , F8
    unbind = , F9
    unbind = , F10
    unbind = , F11
    unbind = , F12

    # Screen Controls
    # --------------------------------------------------------------------
    bind = , F3, exec, grim

    # Audio Controls
    # --------------------------------------------------------------------
    $hc=Hardware Controls
    $d=[$hc|Audio]
    binddl  = , F8,  $d toggle mute output, exec, $scrPath/volumecontrol.sh -o m # toggle audio mute
    binddel = , F9,  $d decrease volume,    exec, $scrPath/volumecontrol.sh -o d # decrease volume
    binddel = , F10, $d increase volume,    exec, $scrPath/volumecontrol.sh -o i # increase volume
  '';
}
