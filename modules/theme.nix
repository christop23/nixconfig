
{ pkgs, ... }:

{
    gtk = {
        enable = true;

        theme = {
            name = "Qogir-Dark";
            package = pkgs.qogir-theme;
        };

        iconTheme = {
            name = "Qogir";
            package = pkgs.qogir-icon-theme;
        };
    };

    qt = {
        enable = true;
        platformTheme = "gtk";
        style.name = "adwaita-dark";
        style.package = pkgs.adwaita-qt;
    };
}