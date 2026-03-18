# DOCUMENTATION:
#
# Visit https://github.com/richen604/hydenix/blob/main/docs/options.md for more options
#
{ config, pkgs, ... }:

{
  imports = [
    # ./example.nix - add your modules here
  ];

  # home-manager options go here
  home.packages = [
    # pkgs.vscode - hydenix's vscode version
    # pkgs.userPkgs.vscode - your personal nixpkgs version
  ];

  # hydenix home-manager options go here
  hydenix.hm = {
    enable = true;
    theme.active = "1-Bit";

    screenshots = {
      enable = true;
      grim.enable = true;
      slurp.enable = true;
    };

    terminals = {
      enable = true;
      kitty = {
        enable = true;
        configText = ''
          # This is the configuration file for kitty terminal
          # For more information, see https://sw.kovidgoyal.net/kitty/conf.html
          # For your custom configurations, put it in ./kitty.conf

          font_family FiraCode Nerd Font Mono
          bold_font auto
          italic_font auto
          bold_italic_font auto
          enable_audio_bell no
          font_size 8.5
          window_padding_width 25
          cursor_trail 1
          scrollback_lines 40000

          # Themes can override any settings in this file
          #include theme.conf
          #background_opacity 0.60
          #hide_window_decorations yes
          #confirm_os_window_close 0
        '';
      };
    };

    lockscreen.hyprlock = true;

    hyprland = {
      hypridle = {
        enable = true;
        extraConfig = ''
          general {
            lock_cmd = pidof hyprlock || hyprlock
            before_sleep_cmd = loginctl lock-session
            after_sleep_cmd = hyprctl dispatch dpms on && sleep 2 && kanshictl reload
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

      extraConfig = ''
        exec-once = kanshi -c ~/.config/kanshi/config
        exec-once = bluetoothctl power on
        exec-once = sleep 2 && bluetoothctl connect C9:26:02:27:F6:6C # Force `MX Master 3` mouse
      '';

      keybindings.extraConfig = ''
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
    };

  };
}
