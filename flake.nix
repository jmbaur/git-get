{
  description = "git-get";

  inputs.nixpkgs.url = "nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }: {
    overlays.default = final: prev: {
      git-get = prev.callPackage ./git-get.nix { };
    };
  } //
  flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        overlays = [ self.overlays.default ];
        inherit system;
      };
    in
    rec {
      devShells.default = pkgs.mkShellNoCC {
        CGO_ENABLED = 0;
        buildInputs = [ pkgs.go_1_18 ];
      };
      packages.default = pkgs.git-get;
      apps.default = apps.git-get;
    });

}
