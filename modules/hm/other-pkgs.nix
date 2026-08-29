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
    mpv
    antigravity
    proton-vpn
    ffmpeg
    avahi
    stash
    kdePackages.kdenlive
    handbrake
    rustdesk
    obsidian
    kubectl
    kubernetes
    opencode
    arduino-ide
  ];

}
