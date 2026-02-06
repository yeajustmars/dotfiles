{ lib, pkgs, self, ... }:

{
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];
}
