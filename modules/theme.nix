
{ pkgs, ... }:

{
    gtk.theme = {
        name = "Qogir";
        #package = pkgs.qogir-theme;
    };
    gtk.iconTheme = {
        name = "Qogir";
        package = pkgs.Qogir-icon-theme;
    };
    qt = {
        enable = true;
        platformTheme = "gtk";
        style.name = "adwaita-dark";
        style.package = pkgs.adwaita-qt;
    };
}