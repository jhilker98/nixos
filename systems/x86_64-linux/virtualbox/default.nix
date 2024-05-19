{
    lib,
    pkgs,
    inputs,
    system,
    target,
    format,
    virtual,
    systems,
    config,
    ...
}:
{
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
  };
}
