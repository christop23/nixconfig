
{ pkgs, ... }:

{
    gtk.iconTheme = {
        name = "Qogir";
        package = pkgs.qogir-icon-theme;
    };
}