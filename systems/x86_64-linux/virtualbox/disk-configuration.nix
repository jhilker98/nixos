{ inputs, ... }:

{
  imports = [

    inputs.disko.nixosModules.disko
  ];
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/disk/by-label/nixos";
        content = {
          type = "gpt";
          partitions = {
            TOW-BOOT-FI = {
              priority = 1;
              type = "EF00";
              size = "32M";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = null;
              };
              hybrid = {
                mbrPartitionType = "0x0c";
                mbrBootableFlag = false;
              };
            };
            ESP = {
              type = "EF00";
              size = "512M";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            root = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
          };
        };
      };
    };
  };
}
