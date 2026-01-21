{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    # Language and formatters
    uv
    cargo
    go
    nodejs
    stylua
    luajit
    luarocks

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

    # CLI tools
    tree
    ripgrep
    fd
    tree-sitter
    lazygit
    imagemagick
    ghostscript

    # Document and rendering 
    mermaid-cli
    tectonic
  ];
}
