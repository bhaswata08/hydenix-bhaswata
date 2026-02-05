{ pkgs, ... }:

{
  imports = [
    ./dev-pkgs.nix
    ./disable-shit-apps.nix
    ./gaming-pkgs.nix
    ./git.nix
    ./hyprland.nix
    ./kitty.nix
    ./other-pkgs.nix
    ./starship.nix
    ./xdg-defaults.nix
  ];

  # home-manager options go here
  home.packages = [
    # pkgs.vscode - hydenix's vscode version
    # pkgs.userPkgs.vscode - your personal nixpkgs version
    pkgs.rembg
  ];
  hydenix.hm.editors.default = "nvim";
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
      $BROWSER = zen
      '';
    };
  };
    # Visit https://github.com/richen604/hydenix/blob/main/docs/options.md for more options
}
