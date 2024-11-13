{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
    buildInputs = with pkgs; [
        rustup
        clang
        gnumake
        cmake
    ];
}
