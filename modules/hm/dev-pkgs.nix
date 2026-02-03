{ pkgs, inputs, ... }:

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

    # Document and rendering 
    mermaid-cli
    tectonic
    pandoc
  ];
}
