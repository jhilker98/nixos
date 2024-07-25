{config, lib, pkgs, inputs, ...}:
{
  home.sessionVariables = {
    "WSLHOME" = "/mnt/c/Users/camoh/";
    "PATH" = "$PATH:$WSLHOME/.local/bin";
  };
  programs.zsh.initExtra = ''
  . "$HOME/.nix-profile/etc/profile.d/nix.sh"
    sudo /etc/init.d/dbus start &> /dev/null
    export $(dbus-launch)
  '';
  programs.zsh.sessionVariables = {
    "DISPLAY" = "$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0";
  };
  programs.zsh.shellAliases = {
    "spicetify" = "spicetify.exe";
    "rd" = "rolldice -s $@";
    "notify-send" = "wsl-notify-send.exe $@";
  };
  programs.bash.shellAliases = {
    "rd" = "rolldice -s $@";
    "notify-send" = "wsl-notify-send.exe $@";
  };
  programs.fish.shellAliases = {
    "rd" = "rolldice -s $argv";
    "notify-send" = "wsl-notify-send.exe $argv";
  };
  }
