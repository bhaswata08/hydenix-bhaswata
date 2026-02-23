{ 
  home.file.".local/share/waybar/modules/idle_inhibitor.jsonc".text = ''
  {
    "idle_inhibitor": {
      "format": "{icon}",
      "rotate": 0,
      "start-activated": true,
      "format-icons": {
        "activated": "\udb80\udd76",
        "deactivated": "\udb81\udeca"
      },
      "justify": "center",
      "tooltip": "true",
      "tooltip-format-activated": "<span foreground='#98c379'>\udb80\udd76 Caffeine Mode Active</span>\nPrevents system from going to sleep",
      "tooltip-format-deactivated": "<span foreground='#e06c75'>\udb81\udeca Caffeine Mode Inactive</span>\nSystem will follow normal power settings"
    }
  }
  '';
  home.file.".config/waybar/modules/idle_inhibitor.jsonc".text = ''
    {
      "idle_inhibitor": {
        "format": "{icon}",
        "rotate": 0,
        "start-activated": true,
        "format-icons": {
          "activated": "\udb80\udd76",
          "deactivated": "\udb81\udeca"
        },
        "justify": "center",
        "tooltip": "true",
        "tooltip-format-activated": "<span foreground='#98c379'>\udb80\udd76 Caffeine Mode Active</span>\nPrevents system from going to sleep",
        "tooltip-format-deactivated": "<span foreground='#e06c75'>\udb81\udeca Caffeine Mode Inactive</span>\nSystem will follow normal power settings"
      }
    }
  '';
  programs.waybar.settings.modules."idle_inhibitor"."start-activated" = true;
}
