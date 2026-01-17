{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    flatpak
    kdePackages.discover
    gnome-software
  ];
services.flatpak.enable = true;
}
