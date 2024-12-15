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
      nixvim.enable = true;
    };
  };



}