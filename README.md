 # INSTALLATION
* sudo -i
* printf "label: gpt\n,550M,U\n,,L\n" | sfdisk /dev/sdX
* nix-shell -p btrfs-progs
* mkfs.fat -F 32 /dev/sdX1
* mkfs.btrfs /dev/sdX2
* mkdir -p /mnt
* mount /dev/sdX2 /mnt
* btrfs subvolume create /mnt/root
* btrfs subvolume create /mnt/home
* btrfs subvolume create /mnt/nix
* btrfs subvolume create /mnt/swap
* umount /mnt
* mount -o compress=zstd,subvol=root /dev/sdX2 /mnt
* mkdir /mnt/{home,nix,swap}
* mount -o compress=zstd,subvol=home /dev/sdX2 /mnt/home
* mount -o compress=zstd,noatime,subvol=nix /dev/sdX2 /mnt/nix
* mount -o subvol=swap /dev/sdXY /mnt/swap
* btrfs filesystem mkswapfile --size 8g --uuid clear /mnt/swap/swapfile
* mkdir /mnt/boot
* mount /dev/sdX1 /mnt/boot
* nixos-generate-config --root /mnt
* nix-shell -p git
* git clone https://github.com/christop23/nixconfig.git /mnt/etc/nixos/dots
* rm /mnt/etc/nixos/configuration.nix
* cp /mnt/etc/nixos/dots/configuration.nix /mnt/etc/nixos/
* rm -r /mnt/etc/nixos/dots

# COMPRESSION AND SWAP
nixos-generate-config --show-hardware-config doesn't detect mount options automatically, so to enable compression, you must specify it and other mount options in a persistent configuration: <br>

fileSystems = { <br>
    "/".options = [ "compress=zstd" ]; <br>
    "/home".options = [ "compress=zstd" ]; <br>
    "/nix".options = [ "compress=zstd" "noatime" ]; <br>
    "/swap".options = [ "noatime" ]; <br>
  };

Finally, add the swap file to your configuration and nixos-rebuild switch: <br>

swapDevices = [ { device = "/swap/swapfile"; } ]; <br>

For more idea on this, have a look at the <a href="https://github.com/christop23/nixconfig/blob/main/hardware-configuration.nix">hardware-configuration.nix</a> file

* nixos-install
* reboot

# POST INSTALLATION STEPS
Login as root and do:
* passwd `username` (replace 'username' with your user name)
* reboot

Login as user and do:

* nix-shell -p git
* git clone https://github.com/christop23/nixconfig.git ~/.dotfiles
* cd ~/.dotfiles
* rm hardware-configuration.nix (copy your new config from /etc/nixos/)
* sudo nixos-rebuild switch --flake .#
* reboot

Login as user and do:

* rm ~/.bash_history
