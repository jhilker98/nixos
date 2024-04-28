{
  description = "Jacob's NixOS and home-manager flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager-wsl.url = "github:viperML/home-manager-wsl";
    nix-colors.url = "github:misterio77/nix-colors";
    stylix.url = "github:danth/stylix";
    nixvim = {
      url = "github:pta2002/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    base16-schemes = {
      url = "github:tinted-theming/base16-schemes";
      flake = false;
    };
    hyprland.url = "github:hyprwm/Hyprland";
    nix-wallpaper.url = "github:lunik1/nix-wallpaper";
    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      # You must provide our flake inputs to Snowfall Lib.
      inherit inputs;

      # The `src` must be the root of the flake. See configuration
      # in the next section for information on how you can move your
      # Nix files to a separate directory.
      src = ./.;

      namespace = "jhilker98-dotfiles";
      meta = {
        # A slug to use in documentation when displaying things like file paths.
        name = "jhilker98-dotfiles";

        # A title to show for your flake, typically the name.
        title = "Jacob's NixOS Flake";
      };
    };
}
