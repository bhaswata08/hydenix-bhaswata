{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    bottles      
    vulkan-tools  
    vulkan-loader
    vulkan-validation-layers
    mangohud       
  ];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;  # Important for 32-bit Wine games
    extraPackages = with pkgs; [
      intel-media-driver  
      intel-vaapi-driver
      libva-vdpau-driver
      libvdpau-va-gl
    ];
  };
  programs.gamemode.enable = true;
}
