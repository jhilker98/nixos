{ lib, pkgs, inputs, system, target, format, virtual, systems, config, ... }: {

#  imports = [
#    ./disk-configuration.nix
#  ];
  networking.hostName = "virtualbox";
  boot.loader = {
    grub = {
      enable = true;
      device = "/dev/sda";
    };
  };
  jhilker98 = {
    nixos = {
      common.enable = true;
      desktop.enable = true;
    };
  };

}
