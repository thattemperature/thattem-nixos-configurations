{ config, ... }:

{

  networking = {
    hostName = config.private.hostname;
    networkmanager.enable = true;
  };

  services.resolved.enable = true;

}
