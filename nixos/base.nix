{ ... }: {
    i18n.defaultLocale = "en_US.UTF-8";
    time.timeZone = "America/Michigan";

    networking.hostName = "specnix";
    networking.networkmanager.enable = true;

    console = {
        keyMap = "us";
        font = "Lat2-Terminus16";
        fontSize = 12;
    };

    services.pipewire = {
        enable = true;
        pulseaudio.enable = true;
    };
}
