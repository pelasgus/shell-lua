# Author: D.A.Pelasgus
# shell-lua.nix
let
  # Unstable Channel | Rolling Release
  pkgs = import (fetchTarball "https://github.com/nixos/nixpkgs/archive/nixos-unstable.tar.gz") { };
  packages = with pkgs; [
    lua                  # Lua interpreter
    luarocks             # Lua package manager
    lua-language-server  # LSP for better IDE support
    stylua               # Lua code formatter
  ];
in

# Create the shell environment
pkgs.mkShell {
  buildInputs = packages;

  shellHook = ''
    echo ""  # Empty line before the message
    echo -e "\e[35mLua development environment activated, \e[32m\e[1m$(whoami)\e[0m\e[35m!\e[0m"
  '';
}
