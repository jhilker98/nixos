{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # The name "snowfall-lib" is required due to how Snowfall Lib processes your
    # flake's inputs.
    snowfall-lib = {
      url = "github:snowfallorg/lib/dev";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    snowfall-flake = {
      url = "github:snowfallorg/flake";
      # Flake requires some packages that aren't on 22.05, but are available on unstable.
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";

    fzf-marks = {
      url = "github:urbainvaes/fzf-marks";
      flake = false;
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
      inputs.nixpkgs.follows = "nixpkgs";
    };
    base16-themes = {
      url = "github:tinted-theming/schemes";
      flake = false;
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

      channels-config = { allowUnfree = true; };

      snowfall = {
        # Choose a namespace to use for your flake's packages, library,
        # and overlays.
        namespace = "jhilker98";
        package-namespace = "jhilker98";
        # Add flake metadata that can be processed by tools like Snowfall Frost.
        meta = {
          # A slug to use in documentation when displaying things like file paths.
          name = "jhilker98-dotfiles";

          # A title to show for your flake, typically the name.
          title = "Jacob's NixOS dotfiles";
        };
      };
      overlays = with inputs;
        [
          # Use the overlay provided by this flake.
          snowfall-flake.overlays.default
        ];
      systems = {
        modules.nixos = with inputs; [

        ];
        hosts = {

        };
      };
      homes = {
        modules = with inputs; [
          nixvim.homeManagerModules.nixvim
          stylix.homeManagerModules.stylix
        ];
        users = { "jhilker@wsl".modules = with inputs; [ ]; };
      };
    };

}
