
{ lib, pkgs, config, ... }:

{
  stylix = {
    image = pkgs.fetchurl {
      name = "Wallpaper.jpg";
      url = "https://w.wallhaven.cc/full/85/wallhaven-8586my.png";
      sha256 = "sha256-dDYu/P82yhc5OISu2hf5EOG//YPaX5JvALOz6zAddKM=";
    };

    polarity = "dark";

    fonts = rec {
      monospace = {
        name = "Fira Code Nerd Font";
        package = with pkgs; (nerdfonts.override { fonts = [ "FiraCode" ]; });
      };
      sansSerif = {
        name = "Cantarell";
        package = pkgs.cantarell-fonts;
      };
      serif = sansSerif;
    };

    cursor = {
      package = pkgs.qogir-icon-theme;
      name = "Qogir";
    };
  };
}
