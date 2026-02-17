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
    #theme.active = "Catppuccin Mocha";
    theme.active = "One Dark";

    screenshots = {
      enable = true;
      grim.enable = true;
      slurp.enable = true;
    };

    lockscreen.hyprlock = false;

    hyprland = {
      hypridle = {
        enable = true;
        extraConfig = ''
          general {
            after_sleep_cmd = hyprctl dispatch dpms on
          }

          listener {
              timeout = 600
              on-timeout = hyprctl dispatch dpms off
              on-resume = hyprctl dispatch dpms on
          }
        '';
      };

      extraConfig = ''
        exec-once = kanshi -c ~/.config/kanshi/config
      '';

      keybindings.extraConfig = ''
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
