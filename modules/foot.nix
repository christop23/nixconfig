
{ pkgs, ... }:

{
    programs.foot = {
        enable = true;
        settings = {
            cursor = {
                blink = "true";
            };
        };
    };
}
