{ config, lib, ... }:

{

  config = lib.mkMerge [

    {
      nix.channel.enable = false;
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      nix = {
        optimise = {
          automatic = true;
          dates = "daily";
          randomizedDelaySec = "10min";
        };
        gc = {
          automatic = true;
          dates = "daily";
          randomizedDelaySec = "10min";
          options = "--delete-older-than 4d";
        };
      };
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
