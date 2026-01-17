{ ... }:

{
  imports = [
    ./hyprland.nix
    ./kitty.nix
    ./starship.nix
    # ./example.nix - add your modules here
  ];

  # home-manager options go here
  home.packages = [
    # pkgs.vscode - hydenix's vscode version
    # pkgs.userPkgs.vscode - your personal nixpkgs version
  ];
  hydenix.hm.editors.default = "nvim";

  # hydenix home-manager options go here
  hydenix.hm.enable = true;
  # Visit https://github.com/richen604/hydenix/blob/main/docs/options.md for more options
}
