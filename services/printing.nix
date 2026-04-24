{
  config,
  lib,
  pkgs,
  ...
}:

{

  config = lib.mkIf config.thattem-nixos.advanced.enable {

    services.printing = {
      enable = true;
      browsing = true;
      drivers = with pkgs; [ hplip ];
    };
  };

}
