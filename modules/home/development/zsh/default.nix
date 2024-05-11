{ lib, config, pkgs, inputs, ... }:

with lib;
with lib.jhilker98;
let cfg = config.jhilker98.zsh;
in {
  options.jhilker98.zsh = { enable = mkEnableOption "Zsh"; };

  config = mkIf cfg.enable {
    programs = {
      zsh = {
        enable = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        autocd = true;
	dotDir = ".config/zsh";
	initExtra = ''
	  export $(dbus-launch)
	'';
      };
    };

  };
}
