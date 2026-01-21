{ pkgs, ... }:

{
  imports = [
    ./hyprland.nix
    ./starship.nix
    ./git.nix
    ./kitty.nix
    ./dev-pkgs.nix
    ./gaming-pkgs.nix
  ];

  # home-manager options go here
  home.packages = [
    # pkgs.vscode - hydenix's vscode version
    # pkgs.userPkgs.vscode - your personal nixpkgs version
    pkgs.rembg
  ];
  hydenix.hm.editors.default = "nvim";

  # hydenix home-manager options go here
  home.sessionVariables = {
    BROWSER = "zen";
  };
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "zen.desktop";
      "x-scheme-handler/http" = "zen.desktop";
      "x-scheme-handler/https" = "zen.desktop";
      "x-scheme-handler/about" = "zen.desktop";
      "x-scheme-handler/unknown" = "zen.desktop";
    };
  };
  hydenix.hm = {
    enable = true;
    hyprland.keybindings = {
      enable = true;
      extraConfig = ''
        bind = $mainMod, B, exec, zen
      '';
    };
  };
    # Visit https://github.com/richen604/hydenix/blob/main/docs/options.md for more options
}
