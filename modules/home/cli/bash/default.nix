{ config, lib, pkgs, inputs, ... }:
with lib;
with lib.jhilker98;
let cfg = config.jhilker98.bash;
mkGitIgnore = ''
  toIgnore=$(curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/list | sed 's/,/\n/g' | fzf -m | xargs | sed 's/\s/,/g')
    curl -sL "https://www.toptal.com/developers/gitignore/api/$toIgnore" >> .gitignore
        '';
in {
  options.jhilker98.bash.enable = mkEnableOption "Bash";
  config = mkIf cfg.enable {
    programs = {
      bash = {
        enable = true;
        shellAliases = {
          ls = "${pkgs.eza}/bin/eza -alh --group-directories-first";
          cat = "${pkgs.bat}/bin/bat -p";
        };

      };
    };
  };
}
