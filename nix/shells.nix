{ pkgs, packages, env, shellHook }:
with env;
{
  default = pkgs.mkShell {
    buildInputs = system ++ main ++ dev ++ env.lint ++ infra;
    inherit shellHook;
  };

  ci = pkgs.mkShell {
    buildInputs = system ++ main ++ lint ++ infra;
    inherit shellHook;
  };

  releaser = pkgs.mkShell {
    buildInputs = system ++ main ++ lint ++ infra ++ releaser;
    inherit shellHook;
  };
}
