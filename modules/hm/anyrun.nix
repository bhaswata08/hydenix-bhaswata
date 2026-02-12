{ pkgs, inputs, ... }:
{
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
      ExecStart = "${inputs.kidex.packages.${pkgs.system}.kidex}/bin/kidex";
      Restart = "always";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}

