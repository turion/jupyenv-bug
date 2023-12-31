{
  description = "A very basic flake";

  inputs = {
    jupyenv = {
      url = "github:tweag/jupyenv";
    };
  };

  outputs = { self, nixpkgs, jupyenv }:
  let system = "x86_64-linux";
  in {
    devShells.x86_64-linux.default = with import nixpkgs { inherit system; }; mkShell {
      packages = [
        (jupyenv.lib.${system}.mkJupyterlabNew {})
      ];
    };

    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

  };
}
