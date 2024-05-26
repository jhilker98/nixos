{config, lib, inputs, pkgs, ...}:
with lib;
with lib.jhilker98;
{
  jhilker98 = {
    common.enable = true;
    theme.enable = true;
    desktop.enable = true;
  };
}
