{config, lib, pkgs, ...}:
with lib;
with lib.jhilker98;
  let
    cfg = config.jhilker98.development.emacs;
  in {
    options.jhilker98.development.emacs = {
      enable = mkEnableOption "Emacs"; 
    }; 
    config = mkIf cfg.enable {
      programs.emacs = {
        enable = true;
        package = pkgs.emacs29;
      };
      services.emacs = {
        enable = true;
      };
      xdg.configFile."doom" = {
        source = ./config;
	recursive = true;
      };
	home.sessionVariables."DOOMDIR" = "$HOME/.dotfiles/modules/home/development/emacs/config";
    };
  }

