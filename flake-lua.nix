# Author: D.A.Pelasgus
# flake-lua.nix

{
  description = "Lua development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/unstable";  # Using unstable channel
  };

  outputs = { self, nixpkgs, ... }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";  # Adjust for your architecture
      };
      packages = with pkgs; [
        lua                  # Lua interpreter
        luarocks             # Lua package manager
        lua-language-server  # LSP for better IDE support
        stylua               # Lua code formatter
      ];
    in
    {
      # Flake specific: provides the development shell environment
      devShell = pkgs.mkShell {
        buildInputs = packages;

        shellHook = ''
          echo ""  # Empty line before the message
          echo -e "\e[35mLua development environment activated, \e[32m\e[1m$(whoami)\e[0m\e[35m!\e[0m"
        '';
      };
    };
}
