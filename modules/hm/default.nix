{ pkgs, ... }:

{
  imports = [
    ./hyprland.nix
    ./starship.nix
    ./git.nix
    ./kitty.nix
    ./dev-pkgs.nix
    ./gaming-pkgs.nix
    ./other-pkgs.nix
    ./xdg-defaults.nix
  ];

  # home-manager options go here
  home.packages = [
    # pkgs.vscode - hydenix's vscode version
    # pkgs.userPkgs.vscode - your personal nixpkgs version
    pkgs.rembg
  ];
  hydenix.hm.editors.default = "nvim";
  hydenix.hm.editors.vscode.enable = false;
  hydenix.hm.theme.active = "Green Lush";

  # hydenix home-manager options go here
  home.sessionVariables = {
    BROWSER = "zen";
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
