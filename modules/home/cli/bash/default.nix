{ config, lib, pkgs, inputs, ... }:
with lib;
with lib.jhilker98;
let cfg = config.jhilker98.bash;
in {
  options.jhilker98.bash.enable = mkEnableOption "Bash";
  config = mkIf cfg.enable {
    programs = {
      bash = {
        enable = true;
        shellAliases = {
          ref = "source ~/.bashrc";
          ls = "${pkgs.eza}/bin/eza -alh --group-directories-first";
          cat = "${pkgs.bat}/bin/bat -p";
        };
      };
    };
  };
}
