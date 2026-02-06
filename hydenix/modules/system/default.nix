{ lib, pkgs, self, ... }:

{
  imports = [
    # ./example.nix - add your modules here
    ./fonts.nix
  ];

  environment.systemPackages = with pkgs; [
    alacritty
    babashka
    btop
    chezmoi
    clang
    clj-kondo
    gcc
    gh
    ghostty
    git
    gnupg
    jdk21
    jupyter
    k9s
    kanshi
    kitty
    kubectl
    kubecolor
    libiconv
    litecli
    luajit
    maven
    neovim
    nodejs_24
    openssh
    openssl
    pkg-config
    ripgrep
    rustup
    spicetify-cli
    sqlite
    starship
    tmux
    tree
  ];
}
