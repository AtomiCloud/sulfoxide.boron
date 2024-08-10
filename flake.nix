{
  inputs = {
    # util
    flake-utils.url = "github:numtide/flake-utils";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";

    # registry
    nixpkgs.url = "nixpkgs/5e0ca22929f3342b19569b21b2f3462f053e497b";
    nixpkgs-240810.url = "nixpkgs/5e0ca22929f3342b19569b21b2f3462f053e497b";
    atomipkgs.url = "github:kirinnee/test-nix-repo/v27.0.0";


  };
  outputs =
    { self

      # utils
    , flake-utils
    , treefmt-nix
    , pre-commit-hooks

      # registries
    , atomipkgs
    , nixpkgs
    , nixpkgs-240810

    } @inputs:
    (flake-utils.lib.eachDefaultSystem
      (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          pkgs-240810 = nixpkgs-240810.legacyPackages.${system};
          atomi = atomipkgs.packages.${system};
          pre-commit-lib = pre-commit-hooks.lib.${system};
        in
        with rec {
          pre-commit = import ./nix/pre-commit.nix {
            inherit packages pre-commit-lib formatter;
          };
          formatter = import ./nix/fmt.nix {
            inherit treefmt-nix pkgs;
          };
          packages = import ./nix/packages.nix
            {
              inherit pkgs pkgs-240810 atomi;
            };
          env = import ./nix/env.nix {
            inherit pkgs packages;
          };
          devShells = import ./nix/shells.nix {
            inherit pkgs env packages;
            shellHook = checks.pre-commit-check.shellHook;
          };
          checks = {
            pre-commit-check = pre-commit;
            format = formatter;
          };
        };
        {
          inherit checks formatter packages devShells;
        }
      )
    )
  ;

}
