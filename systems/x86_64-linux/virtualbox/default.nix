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

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  boot.initrd.availableKernelModules =
    [ "ata_piix" "ohci_pci" "ehci_pci" "ahci" "sd_mod" "sr_mod" ];
  swapDevices = [ ];
  virtualisation.virtualbox.guest.enable = true;
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s3.useDHCP = lib.mkDefault true;

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
