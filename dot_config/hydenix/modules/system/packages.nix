{ lib, pkgs, self, ... }:

{
  environment.systemPackages = with pkgs; [
    alacritty
    babashka
    btop
    chezmoi
    clang
    clj-kondo
    clojure
    gcc
    gh
    ghostty
    git
    google-chrome
    (google-cloud-sdk.withExtraComponents ([
      google-cloud-sdk.components.gke-gcloud-auth-plugin
    ]))
    gnupg
    hypridle
    hyprlock
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
    minikube
    neovim
    nixd
    nodejs_24
    openssh
    openssl
    pkg-config
    ripgrep
    rustup
    slack
    spicetify-cli
    spotify
    sqlite
    starship
    tmux
    tree
    unzip
    wl-clipboard
  ];
}

