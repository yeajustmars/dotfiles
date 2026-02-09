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

  #hyprland.extraConfig = ''
  #  exec-once = kanshi -c ~/.config/kanshi/config
  #'';

  #hyprland.keybindings.extraConfig = ''
  #  bind = $mainMod SHIFT, K, exec,hyprctl dispatch exec kanshictl reload
  #'';

  };
}
