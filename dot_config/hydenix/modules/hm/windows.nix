{ config, pkgs, ...}:

{
  hydenix.hm.hyprland.extraConfig = ''
    decoration {
      active_opacity = 0.95
      inactive_opacity = 0.85
      fullscreen_opacity = 1.0
    }
  '';

  hydenix.hm.hyprland.windowrules.extraConfig = ''
    # Syntax is: opacity [active] [inactive], class:^(app_class)$

    windowrulev2 = opacity 0.95 override 0.85 override, class:^(firefox)$
    windowrulev2 = opacity 0.92 override 0.85 override, class:^(kitty)$
    windowrulev2 = opacity 0.95 override 0.8 override, class:^(org.kde.dolphin)$

  '';
}
