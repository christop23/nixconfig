
{ lib, config, pkgs, ... }:

{

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures = {
      base = false;
      gtk = true;
    };
    config = rec {
      modifier = "Mod4";

      # disable swaybar
      bars = [{command = "${pkgs.waybar}/bin/waybar";}];

      # default terminal
      terminal = "foot"; 

      fonts = {
        names = [ "Fira Code Nerd Font" ];
        style = "Bold Semi-Condensed";
      };

      gaps = {
        inner = 10;
        outer = 10;
      };

      menu = "bemenu-run --bottom --fn 'Fira Code Nerd Font 14' | xargs swaymsg exec --";

      keybindings = 

        let  modifier = config.wayland.windowManager.sway.config.modifier;
        in lib.mkOptionDefault { 

          "${modifier}+Return" = "exec ${terminal}";
          "${modifier}+Shift+q" = "kill";
          "${modifier}+d" = "exec ${menu}";
          "${modifier}+f" = "fullscreen"; 
          "${modifier}+b" = "exec $BROWSER";
          "${modifier}+c" = "exec code";
          "${modifier}+p" = "exec keepassxc";
          "${modifier}+Shift+b" = "exec nautilus";
          "${modifier}+s" = "exec systemctl poweroff";


         # Switch Workspace
          "${modifier}+1" = "workspace number 1";
          "${modifier}+2" = "workspace number 2";
          "${modifier}+3" = "workspace number 3";
          "${modifier}+4" = "workspace number 4";
          "${modifier}+5" = "workspace number 5";
          "${modifier}+6" = "workspace number 6";
          "${modifier}+7" = "workspace number 7";
          "${modifier}+8" = "workspace number 8";
          "${modifier}+9" = "workspace number 9";
      };

  };

};

  services.swayidle = {
    enable = true;
    timeouts = [  
      { timeout = 180; command = "${pkgs.swaylock}/bin/swaylock -fF"; }  
      { timeout = 900; command = "${pkgs.systemd}/bin/systemctl suspend"; }];
  };

  programs.swaylock = {
    enable = true;
  };

  home.packages = with pkgs; [
    swaybg
    bemenu
    pwvucontrol
    imv
    zathura
    gnome.nautilus
    font-awesome
    wl-clipboard
  ];

}
