{ config, ... }:

{

  networking = {
    hostName = config.thattem.private.hostname;
    networkmanager.enable = true;
  };

}
