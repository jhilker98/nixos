{ lib, config, pkgs, ... }:

with lib;
with lib.jhilker98;
let
  cfg = config.jhilker98.git;
in {
  options.jhilker98.git = {
    enable = mkEnableOption "Git";
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      userName = "Jacob Hilker";
      userEmail = "jacob.hilker2@gmail.com";
      signing = {
        key = "jacob.hilker2@gmail.com";
        signByDefault = true;
      };
      aliases = {
        "cleanup" =
          "grep  -v '\\*\\|master\\|develop\\|dev\\|main' | xargs -n 1 -r git branch -d";
        };
        delta.enable = true;
        extraConfig = {
          init = { defaultBranch = "main"; };
          core = { editor = "nvim"; };
          push = { autoSetupRemote = true; };
          color = { ui = true; };
          format = {
            pretty =
              "%C(italic)(%h)%Creset %C(bold 12)%an%Creset: %C(3)%s %Creset(%ad)";
            };
          };
          ignores = [ "result" "result-*" "node_modules/"  "*~" "*.swp" ];
        };
    };
}
