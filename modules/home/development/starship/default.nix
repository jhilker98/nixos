{ lib, config, pkgs, ... }:

with lib;
with lib.jhilker98;
let
  cfg = config.jhilker98.starship;
in {
  options.jhilker98.starship = {
    enable = mkEnableOption "Starship";
  };

  config = mkIf cfg.enable {
    programs = {
      starship = {
        enable = true;
	enableZshIntegration = mkIf config.jhilker98.zsh.enable true;
	enableBashIntegration = mkIf config.jhilker98.bash.enable true;
	settings = {
	  line_break.disabled = true;
  	};
      };
    };
  };
}
