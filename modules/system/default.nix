{ pkgs, inputs, ... }:

{
  imports = [
    ./dev.nix
    ./gaming.nix
    ./other.nix
  ];

  environment.systemPackages = with pkgs; [
    brave
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    keepassxc
    rpi-imager
    libxcb
    fwupd
    # Bypass tools
    # pkgs.vscode - hydenix's vscode version
    # pkgs.userPkgs.vscode - your personal nixpkgs version
  ];
  services.fwupd.enable = true;
}
