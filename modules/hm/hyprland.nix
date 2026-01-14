{ config, lib, pkgs, ... }:

{
  hydenix.hm.hyprland = {
    enable = true;
    extraConfig = ''
      input {
        kb_options = caps:swapescape
      }
    '';
  };
}
