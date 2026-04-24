{ config, lib, ... }:

{

  config = lib.mkIf config.thattem-nixos.desktop.enable {

    services = {
      pulseaudio.enable = false;
      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };
    };

    security.rtkit.enable = true;
  };

}
