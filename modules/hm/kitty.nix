{ config, lib, pkgs, ... }:

{
  hydenix.hm.kitty = {
    enable = true;
    extraConfig = ''
  font_size 11.0
  window_padding_width 0
  clipboard_control write-clipboard write-primary read-clipboard read-primary
    ''
  };
}
