{ lib, pkgs, inputs, system, target, format, virtual, systems, config, ... }: {

  imports = [
    ./disk-configuration.nix
  ];
  networking.hostName = "virtualbox";
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
    };
  };
  jhilker98 = {
    nixos = {
      common.enable = true;
      desktop.enable = true;
    };
  };

}
