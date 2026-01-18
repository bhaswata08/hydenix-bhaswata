{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    bottles
    vulkan-tools
    vulkan-loader
    vulkan-validation-layers
  ];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;  # Important for 32-bit Wine games
    extraPackages = with pkgs; [
      intel-media-driver  
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
  }
}
