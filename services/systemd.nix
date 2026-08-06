{ config, lib, ... }:

{

  config = lib.mkMerge [

    (lib.mkIf config.programs.clash-verge.enable (
      lib.mkIf config.programs.clash-verge.serviceMode {
        systemd.services.clash-verge = lib.mkMerge [

          (lib.mkIf config.services.tailscale.enable {
            after = [ "tailscaled.service" ];
            wants = [ "tailscaled.service" ];
          })

        ];
      }
    ))

  ];

}
