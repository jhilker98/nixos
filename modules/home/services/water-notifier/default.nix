{config, lib, pkgs, inputs, ...}:
with lib;
with lib.jhilker98;
let
cfg = config.jhilker98.services.waterNotifier;
in {
options.jhilker98.services.waterNotifier = { 
  enable = mkOption {
    default = false;
    description = ''
      Whether or not to enable the water notifier.
    '';
  };
  message = mkOption {
      default = "Drink some water.";
      description = ''
        Message to send.
      '';
    };
      interval = mkOption {
        default = 10;
        description = "Notification frequency, in minutes.";
      };
};


config = mkIf cfg.enable {
  systemd.user.timers."water-reminder" = {
        Unit = { Description = "water break notifier"; };
        Service = {
          PassEnvironment = [ "DISPLAY" "PATH" ];
          ExecStart = ''
            ${pkgs.libnotify}/bin/notify-send -u 'critical' -a 'waterbot' 'Drink water.' "${
              builtins.toString cfg.message
            }"
          '';
        };
        Timer = {
          OnUnitActiveSec = "${builtins.toString cfg.interval}m";
          OnBootSec = "${builtins.toString cfg.interval}m";
          Unit = "water-break.service";
        };
      };
      systemd.user.services."water-reminder" = {
        Unit.Description = "water break notifier";
        serviceConfig.PassEnvironment = "DISPLAY";
        Service.ExecStart = ''
          ${pkgs.libnotify}/bin/notify-send -u "critical" -a "water-break" "Drink water." "${
            builtins.toString cfg.message
          }"
        '';
      };
  };
}