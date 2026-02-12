{ pkgs, ... }:
{
  programs.anyrun = {
    enable = true;
    config = {
      plugins = [
	"${pkgs.anyrun}/lib/libapplications.so"
        "${pkgs.anyrun}/lib/libsymbols.so"
        "${pkgs.anyrun}/lib/librink.so"
        "${pkgs.anyrun}/lib/librandr.so"
        "${pkgs.anyrun}/lib/libwebsearch.so"
        "${pkgs.anyrun}/lib/libkidex.so"
      ];
    };
  };
}
