{ pkgs, inputs, lib, ... }:

{
  home.packages = with pkgs; [
    # Language and formatters
    uv
    go
    nodejs
    stylua
    luajit
    luarocks
    docker
    rustup
    inputs.rustowl.packages.${pkgs.system}.default

    # Shell
    carapace

    # QOL tools
    zoxide
    bat
    delta
    dust
    nh
    nix-output-monitor
    nvd
    viu
    chafa
    ueberzugpp

    # CLI tools
    tree
    ripgrep
    fd
    tree-sitter
    lazygit
    imagemagick
    ghostscript
    dragon-drop
    just
    inputs.pfm.packages.${pkgs.system}.default

    # Document and rendering 
    mermaid-cli
    tectonic
    pandoc

    direnv
    anyrun
    inputs.kidex.packages.${pkgs.system}.kidex
    chromium
    pkgs.brlaser
    cups
  ];
}
