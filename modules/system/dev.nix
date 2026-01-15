{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    # C++
    gcc
    gnumake
    cmake
    clang

    # Language and formatters
    uv
    cargo
    go
    python3
    nodejs
    lua
    stylua
    luajit

    # Shell
    nushell

    # QOL tools
    zoxide
    bat
    delta

    # CLI tools
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
