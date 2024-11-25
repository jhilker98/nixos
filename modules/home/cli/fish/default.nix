{ config, lib, pkgs, inputs, ... }:
with lib;
with lib.jhilker98;
let cfg = config.jhilker98.cli.fish;
in {
  options.jhilker98.cli.fish = { enable = mkEnableOption "Fish"; };
  config = mkIf cfg.enable {
    programs.fish = {
      enable = true;
      functions = {
        "gi" = ''
          set toIgnore $(curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/list | sed 's/,/\n/g' | fzf -m | xargs | sed 's/\s/,/g')
                  curl -sL "https://www.toptal.com/developers/gitignore/api/$toIgnore" >> .gitignore
        '';
      };
    };
  };
}
