{ inputs, ... }:

{
  imports = [

    inputs.disko.nixosModules.disko
  ];
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/sda";
        content = {
          type = "table";
          format = "msdos";
          partitions = [
            {
              name = "swap"
              start = "1MiB";
              end = "-8GB";
              content = {
                type = "swap";
                discardPolicy = "both";
                resumeDevice = true; # resume from hiberation from this device
              };
            {
              name = "root";
              part-type = "primary";
              start = "-8GB";
              end = "100%";
              bootable = true;
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            }
          ];
        };
      };
    };
  };
}
