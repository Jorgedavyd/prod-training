{
  description = "Machine Learning environment with Python, PyTorch, CUDA";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
    python-pkgs.url = "github:nix-community/pynixpkgs"; # Optional
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        pythonEnv = pkgs.python312.withPackages (ps: with ps; [
          numpy
          matplotlib
          pandas
          torch
          torchvision
          torchaudio
          ipykernel
          jupyter
        ]);

      in {
        devShell = pkgs.mkShell {
          name = "ml-shell";

          buildInputs = [
            pythonEnv
            pkgs.cudaPackages.cudatoolkit
            pkgs.direnv
            pkgs.git
          ];

          shellHook = ''
            echo "Welcome to your machine learning shell!"
            export PYTHONPATH=.
          '';
        };
      });
}
