{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    gimp
    onlyoffice-desktopeditors
    kdePackages.kolourpaint
    typst
  ];
}
