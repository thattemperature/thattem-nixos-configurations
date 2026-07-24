{ config, lib, ... }:

{

  config = lib.mkMerge [

    (lib.mkIf config.programs.clash-verge.enable (
      lib.mkIf config.programs.clash-verge.serviceMode {
        systemd.services.clash-verge = lib.mkMerge [

          {
            after = [
              "network-online.target"
              "NetworkManager-wait-online.service"
            ];
            wants = [
              "network-online.target"
              "NetworkManager-wait-online.service"
            ];
          }

          (lib.mkIf config.services.tailscale.enable {
            after = [ "tailscaled.service" ];
            wants = [ "tailscaled.service" ];
          })

        ];
      }
    ))

  ];

}
