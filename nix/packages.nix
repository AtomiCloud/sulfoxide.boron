{ pkgs, atomi, pkgs-240810 }:
let

  all = {
    atomipkgs = (
      with atomi;
      {
        inherit
          pls
          sg;
      }
    );
    p240810 = (
      with pkgs-240810;
      {
        inherit
          coreutils
          sd
          bash
          git
          jq
          yq-go
          skopeo

          # lint
          treefmt
          infisical

          # infra
          k3d
          helm-docs
          kubectl
          gitlint
          shellcheck
          ;
        helm = kubernetes-helm;

      }
    );
  };
in
with all;
atomipkgs //
p240810
