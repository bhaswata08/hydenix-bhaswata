{ config, lib, pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      core.pager = "delta";
      interactive.diffFilter = "delta --color-only";
      delta.enable = true;
    };
  };

}
