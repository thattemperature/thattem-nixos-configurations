{ config, lib, ... }:

{

  config = lib.mkIf config.thattem-nixos.hardware.enable {

    boot.loader = {
      timeout = 8;
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

}
