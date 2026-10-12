{ config, lib, ... }:

{

  config = lib.mkIf (config.thattem.nixos.type == "common") {

    services.avahi = {
      enable = true;
      nssmdns4 = true;
      nssmdns6 = true;
    };
  };

}
