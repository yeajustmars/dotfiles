# FOLLOW THE BELOW INSTRUCTIONS LINE BY LINE TO SET UP YOUR SYSTEM

{ inputs, lib, pkgs, ...  }:
{
  imports = [
    # hydenix inputs - Required modules, don't modify unless you know what you're doing
    inputs.hydenix.inputs.home-manager.nixosModules.home-manager
    inputs.hydenix.nixosModules.default
    # Auto-generated hardware config
    ./hardware-configuration.nix
    # Your custom system modules
    ./modules/system/fonts.nix
    ./modules/system/packages.nix

    # Hardware Configuration - Uncomment lines that match your hardware
    # Run `lshw -short` or `lspci` to identify your hardware

    # GPU Configuration (choose one):
    inputs.nixos-hardware.nixosModules.common-gpu-nvidia # NVIDIA
    # inputs.nixos-hardware.nixosModules.common-gpu-amd # AMD

    # CPU Configuration (choose one):
    inputs.nixos-hardware.nixosModules.common-cpu-amd # AMD CPUs
    # inputs.nixos-hardware.nixosModules.common-cpu-intel # Intel CPUs

    # Additional Hardware Modules - Uncomment based on your system type:
    # inputs.nixos-hardware.nixosModules.common-hidpi # High-DPI displays
    # inputs.nixos-hardware.nixosModules.common-pc-laptop # Laptops
    # inputs.nixos-hardware.nixosModules.common-pc-ssd # SSD storage
  ];

  # If enabling NVIDIA, you will be prompted to configure hardware.nvidia
  boot.kernelParams = [
    "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
    "nvidia_drm.fbdev=1"
  ];
  hardware.nvidia = {
    open = true; # For newer cards, you may want open drivers
    prime = { # For hybrid graphics (laptops), configure PRIME:
      #amdBusId = "PCI:0:2:0"; # Run `lspci | grep VGA` to get correct bus IDs
      #intelBusId = "PCI:0:2:0"; # if you have intel graphics
      #nvidiaBusId = "PCI:1:0:0";
      nvidiaBusId = "PCI:01:00.0";

      offload.enable = false; # Or disable PRIME offloading if you don't care
    };
    modesetting.enable = true;
    powerManagement.enable = true;
    nvidiaSettings = true;
  };

  programs.hyprland.withUWSM = lib.mkForce false;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.power-profiles-daemon.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  services.desktopManager.plasma6.enable = true;

  environment.variables = {
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    OPENSSL_DIR = "${pkgs.openssl.dev}";
    OPENSSL_LIB_DIR = "${pkgs.openssl.out}/lib";
    OPENSSL_INCLUDE_DIR = "${pkgs.openssl.dev}/include";
  };

  # Home Manager Configuration - manages user-specific configurations (dotfiles, themes, etc.)
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    # User Configuration - REQUIRED: Change "hydenix" to your actual username
    # This must match the username you define in users.users below
    users."mars" =
      { ... }:
      {
        imports = [
          inputs.hydenix.homeModules.default
          # Your custom home-manager modules (configure hydenix.hm here!)
          ./modules/hm
        ];
      };
  };

  # User Account Setup - REQUIRED: Change "hydenix" to your desired username (must match above)
  users.users.mars = {
    isNormalUser = true;
    initialPassword = "passwd"; # SECURITY: Change this password after first login with `passwd`
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
    ]; # User groups (determines permissions)
    shell = pkgs.bash; # Default shell (options: pkgs.bash, pkgs.zsh, pkgs.fish)
  };

  # Hydenix Configuration - Main configuration for the Hydenix desktop environment
  hydenix = {
    enable = true; # Enable Hydenix modules
    # Basic System Settings (REQUIRED):
    hostname = "marsnix"; # REQUIRED: Set your computer's network name (change to something unique)
    timezone = "America/Mexico_City"; # REQUIRED: Set timezone (examples: "America/New_York", "Europe/London", "Asia/Tokyo")
    locale = "en_US.UTF-8"; # REQUIRED: Set locale/language (examples: "en_US.UTF-8", "en_GB.UTF-8", "de_DE.UTF-8")
    # For more configuration options, see: ./docs/options.md
  };

  # System Version - Don't change unless you know what you're doing (helps with system upgrades and compatibility)
  system.stateVersion = "25.05";
}
