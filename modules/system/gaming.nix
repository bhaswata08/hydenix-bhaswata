{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    mcontrolcenter
    linuxKernel.packages.linux_zen.msi-ec
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
      intel-vaapi-driver
      libva-vdpau-driver
      libvdpau-va-gl
    ];
  };
}
