{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
    buildInputs = with pkgs; [
        rustup
    ];
    packages = with pkgs; [
        clang
        gnumake
        cmake
    ];
}
