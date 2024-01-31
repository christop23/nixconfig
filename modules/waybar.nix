
{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = 
      { mainBar = {
          position = "top";
          
          modules-left = [ "sway/workspaces" "disk" "idle_inhibitor" "mpd" ];
          modules-center = [ "clock" ];
          modules-right = [ "pulseaudio" "memory" "cpu" "network" "custom/offswitch" "tray" ];

          "sway/workspaces" = { "disable-scroll" = true; };
          
          "idle_inhibitor" = {
            "format" = "{icon}";
            "format-icons" = {"activated" = " "; "deactivated" = " "; };
            "tooltip" = false; };
          
          "pulseaudio" = {
            "scroll-step" = 1;
            "format" = "{icon} {volume}%";
            "format-muted" = "  Mute";
            "format-icons" = {
              "default" = [" " " " " "];
            };
            "states" = {
              "warning" = 50;
            };
            "on-click" = "pwvucontrol";
            "tooltip" = false;
          };

          "clock" = {
            "interval" = 1;
            "format" = "{:%I:%M %p  %A %b %d}";
            "tooltip" = true;
            "tooltip-format" = "<tt>{calendar}</tt>";
          };

          "memory" = {
            "interval" = 1;
            "format" = "  {percentage}%";
            "states" = {
              "warning" = 85;
            };
          };

          "cpu" = {
            "interval" = 1;
            "format" = "  {usage}%";
          };

          "mpd" = {
            "max-length" = 25;
            "format" = "<span foreground='#bb9af7'> </span> {title}";
            "format-paused" = " {title}";
            "format-stopped" = "<span foreground='#bb9af7'> </span>";
            "format-disconnected" = "";
            "on-click" = "foot ncmpcpp";
            "tooltip-format" = "{title} - {artist} ({elapsedTime:%M:%S}/{totalTime:%H:%M:%S})";
          };

          "network" = {
            "interval" = 1;
            "format-wifi" = "  {ipaddr}";
            "format-ethernet" = "  {ipaddr}";
            "format-linked" = " {ipaddr}";
            "format-disconnected" = "  Disconnected";
            "tooltip" = false;
          };

          "disk" = {
            "tooltip" = false;
            "path" = "/";
            "interval" = 60;
            "format" = "  {percentage_used}%";
            "states" = {
            "critical" = 90;
            };
          };

          "custom/offswitch" = {
            "format" = " ";
            "on-click" = "systemctl poweroff";
            "tooltip" = false;
          };

          "tray" = {
            "icon-size" = 15;
            "spacing" = 5;
          };
      };
      };
    style = '' * {
      font-family: "Mononoki Nerd Font";
      font-size: 12pt;
      font-weight: bold;
      border-radius: 0px;
      transition-property: background-color;
      transition-duration: 0.5s;
    }
    @keyframes blink_red {
      to {
        background-color: rgb(242, 143, 173);
        color: rgb(26, 24, 38);
      }
    }
    .warning, .critical, .urgent {
      animation-name: blink_red;
      animation-duration: 1s;
      animation-timing-function: linear;
      animation-iteration-count: infinite;
      animation-direction: alternate;
    }
    window#waybar {
      background-color: transparent;
    }
    window > box {
      margin-left: 5px;
      margin-right: 5px;
      margin-top: 5px;
      background-color: rgb(30, 30, 46);
    }
    #workspaces {
      padding-left: 0px;
      padding-right: 4px;
    }
    #workspaces button {
      padding-top: 5px;
      padding-bottom: 5px;
      padding-left: 6px;
      padding-right: 6px;
    }
    #workspaces button.focused {
      background-color: rgb(181, 232, 224);
      color: rgb(26, 24, 38);
    }
    #workspaces button.urgent {
      color: rgb(26, 24, 38);
    }
    #workspaces button:hover {
      background-color: rgb(248, 189, 150);
      color: rgb(26, 24, 38);
    }
    tooltip {
      background: rgb(48, 45, 65);
    }
    tooltip label {
      color: rgb(217, 224, 238);
    }
    #clock, #memory, #disk, #cpu, #mpd, #idle_inhibitor, #pulseaudio, #network, #custom-offswitch {
      padding-left: 10px;
      padding-right: 10px;
    }
    #memory {
      color: rgb(181, 232, 224);
    }
    #cpu {
      color: rgb(245, 194, 231);
    }
    #clock {
      color: rgb(217, 224, 238);
    }
    #idle_inhibitor {
      color: rgb(221, 182, 242);
    }
    #disk {
      color: rgb(150, 205, 251);
    }
    #pulseaudio {
      color: rgb(245, 224, 220);
    }
    #network {
      color: #ABE9B3;
    }

    #network.disconnected {
      color: rgb(255, 255, 255);
    }
    #custom-offswitch {
      color: rgb(242, 143, 173);
    }
    #tray {
      padding-right: 8px;
      padding-left: 10px;
    }
    #mpd.paused {
      color: #414868;
      font-style: italic;
    }
    #mpd.stopped {
      background: transparent;
    }
    #mpd {
      color: #c0caf5;
    }
    '';
    };
}
