{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        gems = pkgs.bundlerEnv {
          name = "gems";
          ruby = pkgs.ruby;
          gemdir = ./.;
        };
      in
      {
        packages.default = pkgs.stdenv.mkDerivation {
          name = "portfolio";
          src = ./.;
          buildInputs = [ gems ];
          installPhase = ''
            runHook preInstall
            mkdir -p $out
            cp -r _site $out/_site
            runHook postInstall
          '';
        };

        devShells.default = pkgs.mkShell {
          buildInputs = [ gems (pkgs.lowPrio gems.wrappedRuby) ];
        };
      }
    );
}
