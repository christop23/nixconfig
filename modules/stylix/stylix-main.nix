
{ lib, pkgs, config, ... }:

{
  stylix = {
    image = pkgs.fetchurl {
      name = "Wallpaper.jpg";
      url = "https://w.wallhaven.cc/full/2y/wallhaven-2ywd3y.png";
      sha256 = "sha256-JRmmuM09kBOItS2YNcIj3uk2ENOqTbFWWQA6AE4qwus=";
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
