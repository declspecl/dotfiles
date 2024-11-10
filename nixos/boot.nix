{ ... }: {
    boot.loader = {
        efi = {
           canTouchEfiVariables = true; 
           efiSysMountPoint = "/boot/efi";
        };
        grub = {
            enable = true;
            efiSupport = true;
            device = "nodev";
        };
    };

    services.displayManager.gdm = {
        enable = true;
        wayland.enable = true;
    };
}
