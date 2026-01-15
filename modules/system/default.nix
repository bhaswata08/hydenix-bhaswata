{ pkgs, inputs, ... }:

{
  imports = [
    ./dev.nix
  ];

  environment.systemPackages = with pkgs; [
	brave
        inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
	keepassxc
    # pkgs.vscode - hydenix's vscode version
    # pkgs.userPkgs.vscode - your personal nixpkgs version
  ];
}
