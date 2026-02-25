# DOCUMENTATION:
#
# Visit https://github.com/richen604/hydenix/blob/main/docs/options.md for more options
#
{ ... }:

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
    theme.active = "Catppuccin Mocha";
    #theme.active = "One Dark";

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
          font_size 8.0
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
            after_sleep_cmd = hyprctl dispatch dpms on
          }

          listener {
            timeout = 30
            on-timeout = loginctl lock-session
          }

          listener {
              timeout = 60
              on-timeout = hyprctl dispatch dpms off
              on-resume = hyprctl dispatch dpms on
          }
        '';
      };

      extraConfig = ''
        exec-once = kanshi -c ~/.config/kanshi/config
      '';

      keybindings.extraConfig = ''
        $TERMINAL = kitty
        $EDITOR = nvim
        $BROWSER = firefox
        $EXPLORER = dolphin

        bind = $mainMod SHIFT, K, exec,hyprctl dispatch exec kanshictl reload

        $hc=Hardware Controls
        $d=[$hc|Audio]
        binddl  = , F8, $d toggle mute output , exec, $scrPath/volumecontrol.sh -o m # toggle audio mute
        ### binddl  = , XF86AudioMute,$d  toggle mute output, exec, $scrPath/volumecontrol.sh -o m # toggle audio mute
        binddel = , F9, $d decrease volume , exec, $scrPath/volumecontrol.sh -o d # decrease volume
        binddel = , F10, $d increase volume , exec, $scrPath/volumecontrol.sh -o i # increase volume
        binddl  = , XF86AudioMicMute,$d un/mute microphone  , exec, $scrPath/volumecontrol.sh -i m # toggle microphone mute
        binddel = , XF86AudioLowerVolume, $d decrease volume , exec, $scrPath/volumecontrol.sh -o d # decrease volume
        binddel = , XF86AudioRaiseVolume, $d increase volume , exec, $scrPath/volumecontrol.sh -o i # increase volume
      '';
    };

  };
}
