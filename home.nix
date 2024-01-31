
{ config, pkgs, ... }:

{
  # User
  home.username = "christo";
  home.homeDirectory = "/home/christo";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Import nix configs
  imports = [
              ./modules/sway.nix
              ./modules/zsh.nix
              ./modules/librewolf.nix
              ./modules/waybar.nix
              # stylix is imported in nix config
              ./modules/mako.nix
              ./modules/mpd.nix
              ./modules/foot.nix
            ];


  # Environment Variables
  home.sessionVariables = {
    EDITOR = "nano";
    XDG_CURRENT_DESKTOP = "sway";
    GTK_USE_PORTAL = 0;
    TERMINAL = "foot";
    BROWSER = "librewolf";
  };

  # XDG Portals
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
  config = {
    common = {
      default = [ "gtk" ];
    };
    sway = {
      default = [ "gtk" ];
      "org.freedesktop.impl.portal.Screencast" = [ "wlr" ];
      "org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
    };
  };
  };

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Christo Paul";
    userEmail = "christop23@proton.me";
  };

  fonts.fontconfig.enable = true;

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    neofetch
    (nerdfonts.override { fonts = [ "FiraCode" "Mononoki" ]; })
    gnome.nautilus
    font-awesome
    noto-fonts
    noto-fonts-color-emoji
    mpv
    vscodium
    wl-clipboard
    keepassxc
    pwvucontrol
    obs-studio
    libreoffice-fresh
  ];

# XDG
  xdg.enable = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    music = "${config.home.homeDirectory}/Music";
    videos = "${config.home.homeDirectory}/Videos";
    pictures = "${config.home.homeDirectory}/Pictures";
    templates = "${config.home.homeDirectory}/Templates";
    download = "${config.home.homeDirectory}/Downloads";
    documents = "${config.home.homeDirectory}/Documents";
    desktop = null;
    publicShare = null;
    extraConfig = {
      XDG_ARCHIVES_DIR = "${config.home.homeDirectory}/Archives";
      XDG_DOTFILES_DIR = "${config.home.homeDirectory}/.dotfiles";
    };
  };

  home.stateVersion = "23.11";
 }
