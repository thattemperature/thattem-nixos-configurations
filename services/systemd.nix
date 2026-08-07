{ config, lib, ... }:

{

  config = lib.mkMerge [

    (lib.mkIf config.services.tailscale.enable {
      systemd.services.tailscaled = lib.mkMerge [

        (lib.mkIf config.programs.clash-verge.enable (
          lib.mkIf config.programs.clash-verge.serviceMode {
            after = [ "clash-verge.service" ];
            wants = [ "clash-verge.service" ];
          }
        ))

      ];
    })

  ];

}
