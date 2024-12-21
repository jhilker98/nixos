{lib, config, pkgs, inputs, username ? "camoh", ...}:
with lib.jhilker98; {
  jhilker98 = {
    common.enable = true;
    calendar.enable = true;
    git.enable = true;
    cli = {
      starship.enable = true;
      zsh.enable = true;
    };
    dev = {
      enable = true;
      nixvim.enable = true;
      emacs.enable = true;
    };
  };



}