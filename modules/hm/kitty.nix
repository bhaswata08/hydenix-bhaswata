{ config, lib, pkgs, ... }:

{
  hydenix.hm = {
    terminals = {
      enable = true; # enable terminals module
      kitty = {
        enable = true; # enable kitty terminal
        configText = ''
      font_size 13.0
      window_padding_width 0
      clipboard_control write-clipboard write-primary read-clipboard read-primary
        ''; # kitty config text
      };
    };
  };
}
