{ config, lib, ... }:

{

  config = lib.mkIf config.thattem.nixos.advanced.enable {

    services.sunshine = {
      enable = true;
      autoStart = false;
      capSysAdmin = true;
    };
  };

}
