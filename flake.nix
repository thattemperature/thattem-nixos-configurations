{

  description = "Thattemperature's NixOS configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    thattem-nixos-options.url = "github:thattemperature/thattem-nixos-options";
  };

  outputs =
    { self, thattem-nixos-options, ... }:

    {
      nixosModules = {

        default = {
          imports = [
            thattem-nixos-options.nixosModules.default
          ]
          ++ (
            with self.nixosModules;
            basic.imports
            ++ boot.imports
            ++ fonts.imports
            ++ hardware.imports
            ++ i18n.imports
            ++ networking.imports
            ++ programs.imports
            ++ security.imports
            ++ services.imports
            ++ users.imports
          );
        };

        basic = {
          imports = [ ./basic ];
        };

        boot = {
          imports = [ ./boot ];
        };

        fonts = {
          imports = [ ./fonts ];
        };

        hardware = {
          imports = [ ./hardware ];
        };

        i18n = {
          imports = [ ./i18n ];
        };

        networking = {
          imports = [ ./networking ];
        };

        programs = {
          imports = [ ./programs ];
        };

        security = {
          imports = [ ./security ];
        };

        services = {
          imports = [ ./services ];
        };

        users = {
          imports = [ ./users ];
        };

      };
    };

}
