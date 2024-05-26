{ config, lib, pkgs, ... }:

with lib;
with lib.jhilker98; {
  jhilker98 = {
    common.enable = true;
    desktop = {
      qtile.enable = true;
    };
    development = { emacs.enable = lib.mkDefault false; };
    langs = {
      latex.enable = lib.mkDefault false;
      python.enable = lib.mkDefault false;
    };

    git.enable = true;
  };
}
