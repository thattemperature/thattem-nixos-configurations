{

  description = "Thattemperature's NixOS configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    thattem-options.url = "github:thattemperature/thattem-nixos-options";
  };

  outputs =
    { self, thattem-options, ... }:

    {
      nixosModules = {

        default = {
          imports = [
            thattem-options.nixosModules.default
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
