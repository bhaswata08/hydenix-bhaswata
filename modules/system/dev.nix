{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    # C++
    gcc
    gnumake
    cmake
    clang

    # Others
    uv
    cargo
    go
    python3
    ripgrep
    fd
    tree-sitter
    nodejs
  ];
}
