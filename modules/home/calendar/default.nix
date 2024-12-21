{ config, lib, pkgs, inputs, ... }:
with lib;
with lib.jhilker98;
let cfg = config.jhilker98.calendar;
in {
  options.jhilker98.calendar = { enable = mkEnableOption "calendar"; };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [ gcalcli ];
    sops.secrets = {
      "gcal/client_id" = { };
      "gcal/client_secret" = { };
    };

  };

}
