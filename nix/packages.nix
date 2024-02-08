{ pkgs, atomi, pkgs-sep-24-23 }:
let

  all = {
    atomipkgs = (
      with atomi;
      {
        inherit
          infisical
          pls
          sg;
      }
    );
    sep-24-23 = (
      with pkgs-sep-24-23;
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
sep-24-23
