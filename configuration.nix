{
  inputs,
  pkgs,
  config,
  lib,
  ...
}:
  # FOLLOW THE BELOW INSTRUCTIONS LINE BY LINE TO SET UP YOUR SYSTEM
{
  imports = [
    # hydenix inputs - Required modules, don't modify unless you know what you're doing
    inputs.hydenix.inputs.home-manager.nixosModules.home-manager
    inputs.hydenix.nixosModules.default
    ./modules/system # Your custom system modules
    ./hardware-configuration.nix # Auto-generated hardware config

    # Hardware Configuration - Uncomment lines that match your hardware
    # Run `lshw -short` or `lspci` to identify your hardware

    # GPU Configuration (choose one):
    inputs.nixos-hardware.nixosModules.common-gpu-nvidia # NVIDIA
    # inputs.nixos-hardware.nixosModules.common-gpu-amd # AMD

    # CPU Configuration (choose one):
    # inputs.nixos-hardware.nixosModules.common-cpu-amd # AMD CPUs
    inputs.nixos-hardware.nixosModules.common-cpu-intel # Intel CPUs

    # Additional Hardware Modules - Uncomment based on your system type:
    # inputs.nixos-hardware.nixosModules.common-hidpi # High-DPI displays
    inputs.nixos-hardware.nixosModules.common-pc-laptop # Laptops
    # inputs.nixos-hardware.nixosModules.common-pc-ssd # SSD storage
  ];

  boot.initrd.luks.devices = {
    "luks-7282faec-2147-4fdf-b6d8-6529460f9fe1".device = "/dev/disk/by-uuid/7282faec-2147-4fdf-b6d8-6529460f9fe1";
  };
  fileSystems."/home/bhaswata/ssd/fastboi" = {
    device = "/dev/disk/by-uuid/711c37b5-3285-4c01-8fcb-3f170ad206fe";
    fsType = "ext4";
    options = ["defaults" ];
  };

  nix = {
    settings = {
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };


  services.xserver.videoDrivers = [ "nvidia" ];

  services.fstrim = {
    enable = true;
    interval = "weekly";
  };
  boot.kernel.sysctl = {
    "vm.swappiness" = 10;
    "vm.vfs_cache_pressure" = 50;
  };
  boot.kernelModules = [ "msi-laptop" ];

  boot.kernel.sysctl = {
    "vm.laptop_mode" = 0;
  };
  
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    
    prime = {
      # Get correct bus IDs with: lspci | grep -E "VGA|3D"
      intelBusId = "PCI:0:2:0";    # Intel integrated graphics
      nvidiaBusId = "PCI:1:0:0";   # NVIDIA RTX 3060
      
      # Choose ONE of these modes:
      
      # Option 1: Sync mode (both GPUs always on, best performance, more battery drain)
      # sync.enable = true;

      # Option 2: Offload mode (NVIDIA on-demand, better battery life)
      offload = {
        enable = true;
        enableOffloadCmd = true;  # Provides nvidia-offload command
      };
      
      # Option 3: Reverse PRIME (NVIDIA always rendering, best for gaming)
      # reverseSync.enable = true;
    };
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Home Manager Configuration - manages user-specific configurations (dotfiles, themes, etc.)
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    # User Configuration - REQUIRED: Change "hydenix" to your actual username
    # This must match the username you define in users.users below
    users."bhaswata" =
      { ... }:
      {
        imports = [
          inputs.hydenix.homeModules.default
          ./modules/hm # Your custom home-manager modules (configure hydenix.hm here!)
        ];
      };
  };

  # User Account Setup - REQUIRED: Change "hydenix" to your desired username (must match above)
  users.users.bhaswata = {
    isNormalUser = true;
    initialPassword = "password"; # SECURITY: Change this password after first login with `passwd`
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
    ]; # User groups (determines permissions)
    shell = pkgs.nushell; # Default shell (options: pkgs.bash, pkgs.zsh, pkgs.fish)
  };

  # Hydenix Configuration - Main configuration for the Hydenix desktop environment
  hydenix = {
    enable = true; # Enable Hydenix modules
    # Basic System Settings (REQUIRED):
    hostname = "hydenix"; # REQUIRED: Set your computer's network name (change to something unique)
    timezone = "Asia/Kolkata"; # REQUIRED: Set timezone (examples: "America/New_York", "Europe/London", "Asia/Tokyo")
    locale = "en_CA.UTF-8"; # REQUIRED: Set locale/language (examples: "en_US.UTF-8", "en_GB.UTF-8", "de_DE.UTF-8")
    # For more configuration options, see: ./docs/options.md

    boot = {
      useSystemdBoot = false; # disable for GRUB
    };
  };

  boot.loader.grub = {
    theme = lib.mkForce inputs.nixos-grub-themes.packages.${pkgs.system}.hyperfluent;
  };

  # System Version - Don't change unless you know what you're doing (helps with system upgrades and compatibility)
  system.stateVersion = "25.05";
}
