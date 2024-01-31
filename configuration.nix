
{ config, lib, pkgs, ... }:

{
  imports =
    [ # import necessary nix files
      ./hardware-configuration.nix
      # ./modules/stylix.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "jupiter"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  # Nix Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Polkit
  security.polkit.enable = true;

  # Zsh
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  # Fixes for Sway
  security.pam.services.swaylock = {};
  hardware.opengl.enable = true;

  # Misc
  nix.optimise.automatic = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  # Allow Unfree packages to be installed
  nixpkgs.config.allowUnfree = true;

  # Auto Upgrade
  system.autoUpgrade = {
    enable = true;
    flake = "github:christop23/nixconfig";
    flags = [
      "--update-input"
      "nixpkgs"
      "-L" # print build logs
    ];
    dates = "02:00";
    randomizedDelaySec = "45min";
  };

  # Scrubbing
  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
    fileSystems = [ "/" ];
  };

  # Enable sound
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.christo = {
    isNormalUser = true;
    description = "Christo";
    useDefaultShell = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
  ];

  # Don't change this
  system.stateVersion = "23.11";

}

