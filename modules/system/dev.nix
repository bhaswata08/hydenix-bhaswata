{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Necessary tools
    wget
    unzip

    # C++
    gcc
    gnumake
    cmake
    clang

    # Shell
    btop
    nushell
  ];
}
