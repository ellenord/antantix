{
  description = "Чистая NixOS конфигурация на flakes";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { system = system; };
      in {
        packages.default = pkgs.hello;
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.vim
            pkgs.git
            pkgs.gcc
            pkgs.gdb
            pkgs.zsh
            pkgs.tmux
            pkgs.htop
            pkgs.neovim
            pkgs.python3
          ];
          shellHook = ''
            echo "Добро пожаловать в devShell!"
          '';
        };
      }
    ) // {
      nixosConfigurations = {
        hostname = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./configuration.nix
          ];
        };
      };
    };
}
