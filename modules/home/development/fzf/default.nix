{config, lib, pkgs, inputs, ...}:
with lib;
with lib.jhilker98;
let
  cfg = config.jhilker98.fzf;
in {
   options.jhilker98.fzf = {
     enable = mkEnableOption "FZF";
   };

   config = mkIf cfg.enable {
    programs = {
        fzf = {
          enable = true;
        };
    };
   };

 }

