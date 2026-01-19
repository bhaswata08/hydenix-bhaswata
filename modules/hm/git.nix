{ config, lib, pkgs, ... }:
{
  programs.git = {
    enable = true;
    extraConfig = {
      core.pager = "delta";
      interactive.diffFilter = "delta --color-only";
      delta.enable = true;
    };
  };

}
