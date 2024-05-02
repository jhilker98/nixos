{
  lib,
  pkgs,
  inputs,
  home,
  target,
  format,
  virtual,
  host,
  config,
  ...
}: 
{
  home.username = "jhilker";
  home.homeDirectory = "/home/jhilker";
  home.stateVersion = "22.11";

  nixpkgs.config.allowUnfree = true;

}

