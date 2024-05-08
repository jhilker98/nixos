{config, lib, pkgs, ...}:
with lib;
with lib.jhilker98;
  let
    cfg = config.jhilker98.emacs;
  in {
    options.jhilker98.emacs = {
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

    };
  }

