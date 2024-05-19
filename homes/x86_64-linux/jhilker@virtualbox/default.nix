{ config, lib, pkgs, ... }:

{
  jhilker98 = {
    common.enable = true;
    development = { emacs.enable = false; };
    langs = { latex.enable = false; };
    git.enable = true;
  };
}
