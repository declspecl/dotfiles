{ ... }: {
    imports = [
        ./hardware-configuration.nix
        ./boot.nix
        ./system.nix
        ./users.nix
    ];
}
