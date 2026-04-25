{ config, lib, ... }:

{

  config = lib.mkIf config.thattem.nixos.special.enable {

    services.dae = {
      enable = true;
      configFile = config.thattem.secrets.dae-configuration.path;
    };
  };

}
