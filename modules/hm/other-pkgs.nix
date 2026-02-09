{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    anki
    gimp
    onlyoffice-desktopeditors
    kdePackages.kolourpaint
    typst
    qbittorrent-enhanced
    smartmontools
    openfortivpn
    libreoffice
    mpv
    antigravity
    protonvpn-gui
    ffmpeg
    avahi
  ];
}
