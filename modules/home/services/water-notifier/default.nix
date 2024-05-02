{
# Snowfall Lib provides a customized `lib` instance with access to your flake's library
# as well as the libraries available from your flake's inputs.
lib,
# An instance of `pkgs` with your overlays and packages applied is also available.
pkgs,
# You also have access to your flake's inputs.
inputs,

# Additional metadata is provided by Snowfall Lib.
system, # The system architecture for this host (eg. `x86_64-linux`).
target, # The Snowfall Lib target for this system (eg. `x86_64-iso`).
format, # A normalized name for the system target (eg. `iso`).
virtual
, # A boolean to determine whether this system is a virtual target using nixos-generators.
systems, # An attribute map of your defined hosts.

# All other arguments come from the module system.
config, ... }:

with lib;

let cfg = config.services.waterNotifier;
in {
  options = {
    services.waterNotifier = {
      enable = mkOption {
        default = false;
        description = ''
          Whether to enable water break notifier.
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
        description = ''
          How frequently you want to be reminded to drink water, in minutes.
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    systemd.user.timers."water-break" = {
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
    systemd.user.services."water-break" = {
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
