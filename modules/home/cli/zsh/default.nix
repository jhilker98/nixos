{ lib, config, pkgs, inputs, ... }:

with lib;
with lib.jhilker98;
let cfg = config.jhilker98.zsh;
mkGitIgnore = ''
  toIgnore=$(curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/list | sed 's/,/\n/g' | fzf -m | xargs | sed 's/\s/,/g')
    curl -sL "https://www.toptal.com/developers/gitignore/api/$toIgnore" >> .gitignore
        '';

in {
  options.jhilker98.zsh = { enable = mkEnableOption "Zsh"; };

  config = mkIf cfg.enable {
    programs = {
      zsh = {
        enable = true;
        #autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        enableCompletion = true;
        autocd = true;
        dotDir = ".config/zsh";
        shellAliases = {
          ref = "source ~/.config/zsh/.zshrc";
        };
        initExtra = ''
          export $(dbus-launch)
          '';
      };
    };

  };
}
