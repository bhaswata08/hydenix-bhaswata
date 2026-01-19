{ config, lib, pkgs, ... }:

{
  hydenix.hm.hyprland = {
    enable = true;
    extraConfig = ''
      input {
        kb_options = caps:swapescape
	touchpad {
	    natural_scroll = true
	    tap_button_map = lmr
	}
	}
	misc {
	    mouse_move_enables_dpms = true
	    middle_click_paste = false
	}
    '';

  };
}
