{ config, ... }:

{

  networking = {
    hostName = config.thattem.private.hostname;
    networkmanager.enable = true;
  };

  services.resolved = {
    enable = true;
    settings.Resolve = {
      LLMNR = false;
      MulticastDNS = false;
    };
  };

}
