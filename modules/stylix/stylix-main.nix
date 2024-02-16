
{ lib, pkgs, config, ... }:

{
  stylix = {
    image = pkgs.fetchurl {
      name = "Wallpaper.jpg";
      url = "https://w.wallhaven.cc/full/vq/wallhaven-vq5odm.jpg";
      sha256 = "sha256-Fm800h7CbEHqcPDL7oKSBSIpGBhEWLFS6ioV5qM0SVw=";
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
