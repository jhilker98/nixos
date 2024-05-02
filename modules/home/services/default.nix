{
  lib,
  pkgs,
  inputs,
  system,
  target,
  format,
  virtual,
  systems,
  config,
  ...
}: {
  services = {
    water-notifier = import ./water-notifier;
  };
}
