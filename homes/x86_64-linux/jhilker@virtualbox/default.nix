{ config, lib, pkgs, ... }:

{
  jhilker98 = {
    common.enable = true;
    development = { emacs.enable = lib.mkDefault false; };
    langs = {
      latex.enable = lib.mkDefault false;
      python.enable = lib.mkDefault false;
    };

    git.enable = true;
  };
}
