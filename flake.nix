{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        # The name "snowfall-lib" is required due to how Snowfall Lib processes your
        # flake's inputs.
        snowfall-lib = {
            url = "github:snowfallorg/lib";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    # We will handle this in the next section.
    outputs = inputs: {};
}
