{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    bottles      
    vulkan-tools  
    vulkan-loader
    vulkan-validation-layers
    mangohud       
  ];
}
