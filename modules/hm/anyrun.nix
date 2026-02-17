{ pkgs, inputs, ... }:
{
  systemd.user.services.anyrun-daemon = {
    Unit = {
      Description = "Anyrun Daemon";
      # Ensures it only starts once Hyprland/Wayland is ready
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      # Environment ensures it can find its own plugins and Wayland socket
      Environment = [ "PATH=${pkgs.anyrun}/bin" ];
      ExecStart = "${pkgs.anyrun}/bin/anyrun daemon";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };

  programs.anyrun = {
    enable = true;
    config = {
      plugins = [
        "${pkgs.anyrun}/lib/libapplications.so"
          "${pkgs.anyrun}/lib/libsymbols.so"
          "${pkgs.anyrun}/lib/librink.so"
          "${pkgs.anyrun}/lib/librandr.so"
          "${pkgs.anyrun}/lib/libwebsearch.so"
          "${pkgs.anyrun}/lib/libkidex.so"
      ];
    };

    extraConfigFiles."websearch.ron".text = ''
      Config(
          prefix: "?",
          engines: [DuckDuckGo],
          )
      '';

    extraConfigFiles."kidex.ron".text = ''
      Config(
          ignored: [], 
          directories: [
          WatchDir(
            path: "/home/bhaswata/", 
            recurse: true, 
            ignored: [], 
            ),
          ],
          )
      '';
  };
  systemd.user.services.kidex = {
    Unit = {
      Description = "Kidex file indexer";
      After = [ "graphical-session-pre.target" ];
      Partof = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${inputs.kidex.packages.${pkgs.stdenv.hostPlatform.system}.kidex}/bin/kidex";
      Restart = "always";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}

