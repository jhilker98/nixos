{lib, config, pkgs, inputs, ...}:
with lib;
with lib.jhilker98;
let
  cfg = config.jhilker98.zsh;
in {
  options.jhilker98.zsh = {
	enable = mkEnableOption "ZSH";
  };
  config = mkIf cfg.enable {
	programs.zsh = {
	  enable = true;
	  syntaxHighlighting.enable = true;
	  autocd.enable = true;
	};
  };

}
