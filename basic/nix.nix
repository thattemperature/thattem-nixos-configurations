{ config, lib, ... }:

{

  config = lib.mkMerge [

    {
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
    }

    (lib.mkIf config.thattem.nixos.special.enable {

      nix.settings = {
        substituters = config.thattem.private.nix-cache.substituters;
        trusted-public-keys = config.thattem.private.nix-cache.trusted-public-keys;

      };
    })

    (lib.mkIf config.thattem.nixos.special.enable (
      lib.mkIf (config.thattem.secrets.nix-configurations.path != null) {

        nix.extraOptions = "!include ${config.thattem.secrets.nix-configurations.path}";

      }
    ))

  ];

}
