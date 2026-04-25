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
        trusted-public-keys = config.thattem.private.nix-serve.trusted-public-keys;
      };
    })
  ];

}
